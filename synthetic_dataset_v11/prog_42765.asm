; DESCRIPTION: Creates a cyan rectangular region at (60, 181) spanning 76 by 34 pixels.
; PLAN: r0=60(x), r1=181(y), r2=76(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 181
LDI r2, 76
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
