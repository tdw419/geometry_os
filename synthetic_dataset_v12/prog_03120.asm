; DESCRIPTION: Creates a cyan rectangular region at (56, 189) spanning 100 by 20 pixels.
; PLAN: r0=56(x), r1=189(y), r2=100(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 189
LDI r2, 100
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
