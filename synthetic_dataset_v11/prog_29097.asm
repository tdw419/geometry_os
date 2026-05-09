; DESCRIPTION: Creates a cyan rectangular region at (121, 29) spanning 107 by 112 pixels.
; PLAN: r0=121(x), r1=29(y), r2=107(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 29
LDI r2, 107
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
