; DESCRIPTION: Composite: Creates a red rectangular region at (274, 202) spanning 120 by 12 pixels then Sets a single white pixel at (197, 154).
; PLAN: r0=274(x), r1=202(y), r2=120(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=154(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 202
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 154
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
