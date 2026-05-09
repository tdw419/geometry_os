; DESCRIPTION: Creates a cyan rectangular region at (54, 184) spanning 96 by 29 pixels.
; PLAN: r0=54(x), r1=184(y), r2=96(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 184
LDI r2, 96
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
