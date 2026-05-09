; DESCRIPTION: Creates a cyan rectangular region at (63, 93) spanning 97 by 52 pixels.
; PLAN: r0=63(x), r1=93(y), r2=97(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 93
LDI r2, 97
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
