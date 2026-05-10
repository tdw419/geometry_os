; DESCRIPTION: Composite: Renders a yellow box of size 71x42 starting at (356, 175) then Sets a single green pixel at (79, 15).
; PLAN: r0=356(x), r1=175(y), r2=71(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=15(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 175
LDI r2, 71
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 15
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
