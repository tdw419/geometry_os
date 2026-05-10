; DESCRIPTION: Composite: Creates a cyan rectangular region at (95, 127) spanning 65 by 116 pixels then Places a red dot at position (509, 241).
; PLAN: r0=95(x), r1=127(y), r2=65(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=241(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 127
LDI r2, 65
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 241
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
