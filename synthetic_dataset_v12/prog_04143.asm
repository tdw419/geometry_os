; DESCRIPTION: Composite: Creates a magenta rectangular region at (255, 93) spanning 116 by 98 pixels then Places a purple dot at position (224, 132).
; PLAN: r0=255(x), r1=93(y), r2=116(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=132(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 93
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 132
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
