; DESCRIPTION: Composite: . Then Places a cyan 39x92 rectangle at position (97, 27). Then Places a purple line segment connecting (25, 154) to (4, 137).
; PLAN: r0=97(x), r1=27(y), r2=39(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=25(x1), r1=154(y1), r2=4(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 39x92 rectangle at position (97, 27).
; PLAN: r0=97(x), r1=27(y), r2=39(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 27
LDI r2, 39
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (25, 154) to (4, 137).
; PLAN: r0=25(x1), r1=154(y1), r2=4(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 154
LDI r2, 4
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
