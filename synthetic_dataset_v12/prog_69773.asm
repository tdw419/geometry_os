; DESCRIPTION: Creates a cyan rectangular region at (384, 55) spanning 117 by 88 pixels.
; PLAN: r0=384(x), r1=55(y), r2=117(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 55
LDI r2, 117
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
