; DESCRIPTION: Composite: Sets a single green pixel at (291, 71) then Places a white line segment connecting (173, 57) to (294, 47) then Renders a purple box of size 61x72 starting at (251, 101).
; PLAN: r0=291(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=57(y1), r7=294(x2), r8=47(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=101(y), r12=61(width), r13=72(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 57
LDI r7, 294
LDI r8, 47
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 101
LDI r12, 61
LDI r13, 72
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
