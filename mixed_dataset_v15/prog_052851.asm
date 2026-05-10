; DESCRIPTION: Composite: Creates a cyan circular shape at (116, 177) with radius 45 then Places a blue line segment connecting (51, 45) to (320, 1).
; PLAN: r0=116(x), r1=177(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x1), r6=45(y1), r7=320(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 177
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 45
LDI r7, 320
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
