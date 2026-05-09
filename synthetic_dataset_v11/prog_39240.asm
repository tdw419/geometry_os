; DESCRIPTION: Creates a cyan rectangular region at (46, 105) spanning 63 by 110 pixels.
; PLAN: r0=46(x), r1=105(y), r2=63(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 105
LDI r2, 63
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
