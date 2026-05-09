; DESCRIPTION: Composite: Creates a cyan rectangular region at (96, 36) spanning 109 by 64 pixels then Renders a red disk with center (87, 195) and radius 57 then Sets a single red pixel at (294, 38).
; PLAN: r0=96(x), r1=36(y), r2=109(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=195(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=38(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 36
LDI r2, 109
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 195
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 38
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
