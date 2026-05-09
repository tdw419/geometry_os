; DESCRIPTION: Creates a cyan rectangular region at (125, 119) spanning 81 by 37 pixels.
; PLAN: r0=125(x), r1=119(y), r2=81(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 119
LDI r2, 81
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
