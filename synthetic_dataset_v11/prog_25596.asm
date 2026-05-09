; DESCRIPTION: Composite: . Then Draws a green line from (99, 191) to (110, 134). Then Draws a cyan rectangle at (195, 78) with width 29 and height 32.
; PLAN: r0=99(x1), r1=191(y1), r2=110(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=78(y), r2=29(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (99, 191) to (110, 134).
; PLAN: r0=99(x1), r1=191(y1), r2=110(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 191
LDI r2, 110
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (195, 78) with width 29 and height 32.
; PLAN: r0=195(x), r1=78(y), r2=29(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 78
LDI r2, 29
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
