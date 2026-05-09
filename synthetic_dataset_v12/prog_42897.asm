; DESCRIPTION: Creates a cyan rectangular region at (160, 181) spanning 65 by 14 pixels.
; PLAN: r0=160(x), r1=181(y), r2=65(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 181
LDI r2, 65
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
