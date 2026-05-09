; DESCRIPTION: Composite: . Then Renders a purple line between points (222, 8) and (104, 52). Then Places a cyan 114x18 rectangle at position (34, 39).
; PLAN: r0=222(x1), r1=8(y1), r2=104(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=39(y), r2=114(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (222, 8) and (104, 52).
; PLAN: r0=222(x1), r1=8(y1), r2=104(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 8
LDI r2, 104
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 114x18 rectangle at position (34, 39).
; PLAN: r0=34(x), r1=39(y), r2=114(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 39
LDI r2, 114
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
