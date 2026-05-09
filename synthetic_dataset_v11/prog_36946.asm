; DESCRIPTION: Creates a red rectangular region at (177, 142) spanning 39 by 112 pixels.
; PLAN: r0=177(x), r1=142(y), r2=39(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 142
LDI r2, 39
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
