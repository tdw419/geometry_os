; DESCRIPTION: Creates a white rectangular region at (212, 194) spanning 112 by 36 pixels.
; PLAN: r0=212(x), r1=194(y), r2=112(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 194
LDI r2, 112
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
