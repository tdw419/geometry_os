; DESCRIPTION: Composite: Renders a cyan disk with center (291, 166) and radius 67 then Sets a single orange pixel at (458, 176) then Places a black line segment connecting (152, 226) to (247, 74).
; PLAN: r0=291(x), r1=166(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x), r6=176(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=226(y1), r12=247(x2), r13=74(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 166
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 176
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 152
LDI r11, 226
LDI r12, 247
LDI r13, 74
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
