; DESCRIPTION: Composite: Sets a single purple pixel at (384, 130) then Places a white line segment connecting (217, 205) to (469, 129) then Creates a cyan rectangular region at (422, 199) spanning 57 by 25 pixels.
; PLAN: r0=384(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=205(y1), r7=469(x2), r8=129(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=199(y), r12=57(width), r13=25(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 205
LDI r7, 469
LDI r8, 129
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 199
LDI r12, 57
LDI r13, 25
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
