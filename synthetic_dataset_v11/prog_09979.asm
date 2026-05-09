; DESCRIPTION: Composite: . Then Places a blue line segment connecting (249, 3) to (145, 223). Then Draws a black rectangle at (92, 66) with width 59 and height 87.
; PLAN: r0=249(x1), r1=3(y1), r2=145(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=66(y), r2=59(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (249, 3) to (145, 223).
; PLAN: r0=249(x1), r1=3(y1), r2=145(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 3
LDI r2, 145
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (92, 66) with width 59 and height 87.
; PLAN: r0=92(x), r1=66(y), r2=59(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 66
LDI r2, 59
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
