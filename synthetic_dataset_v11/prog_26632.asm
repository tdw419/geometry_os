; DESCRIPTION: Creates a red rectangular region at (152, 105) spanning 64 by 102 pixels.
; PLAN: r0=152(x), r1=105(y), r2=64(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 105
LDI r2, 64
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
