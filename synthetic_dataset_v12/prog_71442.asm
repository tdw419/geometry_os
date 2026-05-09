; DESCRIPTION: Creates a red rectangular region at (309, 182) spanning 87 by 18 pixels.
; PLAN: r0=309(x), r1=182(y), r2=87(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 182
LDI r2, 87
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
