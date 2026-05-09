; DESCRIPTION: Creates a cyan rectangular region at (63, 37) spanning 66 by 40 pixels.
; PLAN: r0=63(x), r1=37(y), r2=66(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 37
LDI r2, 66
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
