; DESCRIPTION: Composite: Creates a magenta rectangular region at (317, 64) spanning 106 by 99 pixels then Sets a single cyan pixel at (487, 209).
; PLAN: r0=317(x), r1=64(y), r2=106(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=209(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 64
LDI r2, 106
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 209
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
