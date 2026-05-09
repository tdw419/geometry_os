; DESCRIPTION: Creates a red rectangular region at (123, 132) spanning 33 by 112 pixels.
; PLAN: r0=123(x), r1=132(y), r2=33(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 132
LDI r2, 33
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
