; DESCRIPTION: Composite: Places a blue line segment connecting (242, 176) to (348, 177) then Draws a white circle centered at (350, 173) with radius 71.
; PLAN: r0=242(x1), r1=176(y1), r2=348(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=173(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 176
LDI r2, 348
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 173
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
