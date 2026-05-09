; DESCRIPTION: Creates a cyan rectangular region at (36, 27) spanning 87 by 105 pixels.
; PLAN: r0=36(x), r1=27(y), r2=87(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 27
LDI r2, 87
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
