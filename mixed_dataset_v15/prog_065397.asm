; DESCRIPTION: Creates a cyan rectangular region at (138, 136) spanning 90 by 87 pixels.
; PLAN: r0=138(x), r1=136(y), r2=90(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 136
LDI r2, 90
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
