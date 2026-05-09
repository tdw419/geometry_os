; DESCRIPTION: Creates a red rectangular region at (233, 152) spanning 96 by 84 pixels.
; PLAN: r0=233(x), r1=152(y), r2=96(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 152
LDI r2, 96
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
