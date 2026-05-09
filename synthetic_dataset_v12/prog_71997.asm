; DESCRIPTION: Creates a cyan rectangular region at (397, 12) spanning 70 by 91 pixels.
; PLAN: r0=397(x), r1=12(y), r2=70(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 12
LDI r2, 70
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
