; DESCRIPTION: Composite: Draws a cyan circle centered at (461, 60) with radius 22 then Places a blue line segment connecting (299, 234) to (405, 203) then Sets a single purple pixel at (453, 112).
; PLAN: r0=461(x), r1=60(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=234(y1), r7=405(x2), r8=203(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=453(x), r11=112(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 60
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 234
LDI r7, 405
LDI r8, 203
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 112
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
