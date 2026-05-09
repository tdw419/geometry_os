; DESCRIPTION: Creates a cyan rectangular region at (61, 88) spanning 101 by 112 pixels.
; PLAN: r0=61(x), r1=88(y), r2=101(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 88
LDI r2, 101
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
