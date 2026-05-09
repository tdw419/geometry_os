; DESCRIPTION: Creates a cyan rectangular region at (112, 72) spanning 60 by 88 pixels.
; PLAN: r0=112(x), r1=72(y), r2=60(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 72
LDI r2, 60
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
