; DESCRIPTION: Composite: Places a white circle of radius 22 at center (216, 137) then Places a magenta line segment connecting (209, 96) to (77, 152).
; PLAN: r0=216(x), r1=137(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=96(y1), r7=77(x2), r8=152(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 137
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 96
LDI r7, 77
LDI r8, 152
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
