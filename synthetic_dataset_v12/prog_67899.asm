; DESCRIPTION: Composite: Renders a cyan line between points (265, 2) and (67, 222) then Creates a red rectangular region at (237, 225) spanning 83 by 27 pixels then Sets a single orange pixel at (233, 226).
; PLAN: r0=265(x1), r1=2(y1), r2=67(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=225(y), r7=83(width), r8=27(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=226(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 2
LDI r2, 67
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 225
LDI r7, 83
LDI r8, 27
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 226
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
