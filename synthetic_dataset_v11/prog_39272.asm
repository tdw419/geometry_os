; DESCRIPTION: Composite: . Then Draws a blue rectangle at (99, 58) with width 106 and height 83. Then Renders a white line between points (219, 44) and (102, 33).
; PLAN: r0=99(x), r1=58(y), r2=106(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=219(x1), r1=44(y1), r2=102(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (99, 58) with width 106 and height 83.
; PLAN: r0=99(x), r1=58(y), r2=106(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 58
LDI r2, 106
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (219, 44) and (102, 33).
; PLAN: r0=219(x1), r1=44(y1), r2=102(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 44
LDI r2, 102
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
