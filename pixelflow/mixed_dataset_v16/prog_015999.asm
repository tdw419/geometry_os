; DESCRIPTION: Creates a red rectangular region at (177, 112) spanning 81 by 92 pixels.
; PLAN: r0=177(x), r1=112(y), r2=81(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 112
LDI r2, 81
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
