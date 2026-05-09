; DESCRIPTION: Composite: . Then Creates a orange circular shape at (66, 59) with radius 10. Then Draws a blue line from (116, 250) to (88, 4).
; PLAN: r0=66(x), r1=59(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x1), r1=250(y1), r2=88(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (66, 59) with radius 10.
; PLAN: r0=66(x), r1=59(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 59
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (116, 250) to (88, 4).
; PLAN: r0=116(x1), r1=250(y1), r2=88(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 250
LDI r2, 88
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
