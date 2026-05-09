; DESCRIPTION: Creates a cyan rectangular region at (88, 160) spanning 80 by 56 pixels.
; PLAN: r0=88(x), r1=160(y), r2=80(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 160
LDI r2, 80
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
