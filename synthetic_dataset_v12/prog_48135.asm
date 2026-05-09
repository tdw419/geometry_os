; DESCRIPTION: Composite: Places a magenta 95x44 rectangle at position (320, 12) then Sets a single orange pixel at (26, 93).
; PLAN: r0=320(x), r1=12(y), r2=95(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 12
LDI r2, 95
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
