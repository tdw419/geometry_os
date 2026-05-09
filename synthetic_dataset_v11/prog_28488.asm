; DESCRIPTION: Creates a red rectangular region at (55, 151) spanning 112 by 48 pixels.
; PLAN: r0=55(x), r1=151(y), r2=112(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 151
LDI r2, 112
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
