; DESCRIPTION: Composite: . Then Draws a yellow line from (136, 91) to (99, 231). Then Draws a cyan rectangle at (14, 100) with width 52 and height 106.
; PLAN: r0=136(x1), r1=91(y1), r2=99(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=14(x), r1=100(y), r2=52(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (136, 91) to (99, 231).
; PLAN: r0=136(x1), r1=91(y1), r2=99(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 91
LDI r2, 99
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (14, 100) with width 52 and height 106.
; PLAN: r0=14(x), r1=100(y), r2=52(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 100
LDI r2, 52
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
