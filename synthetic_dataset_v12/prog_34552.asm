; DESCRIPTION: Creates a cyan rectangular region at (23, 79) spanning 80 by 88 pixels.
; PLAN: r0=23(x), r1=79(y), r2=80(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 79
LDI r2, 80
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
