; DESCRIPTION: Creates a red rectangular region at (152, 0) spanning 96 by 81 pixels.
; PLAN: r0=152(x), r1=0(y), r2=96(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 0
LDI r2, 96
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
