; DESCRIPTION: Creates a cyan rectangular region at (74, 65) spanning 63 by 20 pixels.
; PLAN: r0=74(x), r1=65(y), r2=63(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 65
LDI r2, 63
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
