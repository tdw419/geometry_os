; DESCRIPTION: Composite: Sets a single red pixel at (502, 176) then Creates a white circular shape at (298, 184) with radius 68 then Places a white line segment connecting (112, 211) to (344, 195).
; PLAN: r0=502(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=184(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x1), r11=211(y1), r12=344(x2), r13=195(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 184
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 211
LDI r12, 344
LDI r13, 195
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
