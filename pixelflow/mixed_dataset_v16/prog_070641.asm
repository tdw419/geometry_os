; DESCRIPTION: Composite: Sets a single purple pixel at (290, 67) then Places a yellow line segment connecting (233, 6) to (480, 31) then Places a white circle of radius 28 at center (271, 213).
; PLAN: r0=290(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=6(y1), r7=480(x2), r8=31(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=213(y), r12=28(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 67
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 6
LDI r7, 480
LDI r8, 31
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 213
LDI r12, 28
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
