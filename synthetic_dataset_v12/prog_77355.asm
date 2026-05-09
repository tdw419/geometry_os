; DESCRIPTION: Creates a cyan rectangular region at (90, 145) spanning 79 by 81 pixels.
; PLAN: r0=90(x), r1=145(y), r2=79(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 145
LDI r2, 79
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
