; DESCRIPTION: Creates a cyan rectangular region at (63, 71) spanning 20 by 105 pixels.
; PLAN: r0=63(x), r1=71(y), r2=20(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 71
LDI r2, 20
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
