; DESCRIPTION: Creates a red rectangular region at (97, 177) spanning 86 by 66 pixels.
; PLAN: r0=97(x), r1=177(y), r2=86(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 177
LDI r2, 86
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
