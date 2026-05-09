; DESCRIPTION: Composite: Renders a green disk with center (156, 129) and radius 57 then Creates a red rectangular region at (90, 33) spanning 93 by 64 pixels then Sets a single white pixel at (470, 139).
; PLAN: r0=156(x), r1=129(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=33(y), r7=93(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=139(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 129
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 33
LDI r7, 93
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 139
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
