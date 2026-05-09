; DESCRIPTION: Creates a cyan rectangular region at (36, 29) spanning 48 by 87 pixels.
; PLAN: r0=36(x), r1=29(y), r2=48(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 29
LDI r2, 48
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
