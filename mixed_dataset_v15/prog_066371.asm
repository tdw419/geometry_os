; DESCRIPTION: Creates a white rectangular region at (405, 182) spanning 37 by 31 pixels.
; PLAN: r0=405(x), r1=182(y), r2=37(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 182
LDI r2, 37
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
