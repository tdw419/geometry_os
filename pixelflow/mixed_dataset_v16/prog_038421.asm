; DESCRIPTION: Composite: Creates a red rectangular region at (247, 162) spanning 52 by 18 pixels then Places a red dot at position (217, 57).
; PLAN: r0=247(x), r1=162(y), r2=52(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=57(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 162
LDI r2, 52
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 57
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
