; DESCRIPTION: Creates a magenta rectangular region at (177, 173) spanning 66 by 17 pixels.
; PLAN: r0=177(x), r1=173(y), r2=66(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 173
LDI r2, 66
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
