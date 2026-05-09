; DESCRIPTION: Creates a red rectangular region at (373, 195) spanning 102 by 10 pixels.
; PLAN: r0=373(x), r1=195(y), r2=102(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 195
LDI r2, 102
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
