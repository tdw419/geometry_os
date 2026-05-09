; DESCRIPTION: Creates a red rectangular region at (107, 1) spanning 55 by 112 pixels.
; PLAN: r0=107(x), r1=1(y), r2=55(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 1
LDI r2, 55
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
