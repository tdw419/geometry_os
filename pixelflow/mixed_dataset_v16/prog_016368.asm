; DESCRIPTION: Creates a cyan rectangular region at (160, 79) spanning 33 by 46 pixels.
; PLAN: r0=160(x), r1=79(y), r2=33(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 79
LDI r2, 33
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
