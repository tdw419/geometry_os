; DESCRIPTION: Composite: Sets a single purple pixel at (180, 202) then Places a orange circle of radius 27 at center (120, 43) then Draws a cyan line from (213, 130) to (304, 205).
; PLAN: r0=180(x), r1=202(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=43(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x1), r11=130(y1), r12=304(x2), r13=205(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 202
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 43
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 130
LDI r12, 304
LDI r13, 205
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
