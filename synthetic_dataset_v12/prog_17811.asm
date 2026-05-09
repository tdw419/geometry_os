; DESCRIPTION: Composite: Creates a blue rectangular region at (173, 89) spanning 36 by 109 pixels then Sets a single cyan pixel at (295, 225).
; PLAN: r0=173(x), r1=89(y), r2=36(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=225(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 89
LDI r2, 36
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 225
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
