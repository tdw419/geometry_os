; DESCRIPTION: Creates a cyan rectangular region at (385, 122) spanning 112 by 48 pixels.
; PLAN: r0=385(x), r1=122(y), r2=112(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 122
LDI r2, 112
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
