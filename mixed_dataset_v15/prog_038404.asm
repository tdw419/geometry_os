; DESCRIPTION: Composite: Places a blue line segment connecting (83, 125) to (0, 235) then Renders a blue box of size 24x108 starting at (92, 130).
; PLAN: r0=83(x1), r1=125(y1), r2=0(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=130(y), r7=24(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 125
LDI r2, 0
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 130
LDI r7, 24
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
