; DESCRIPTION: Creates a cyan rectangular region at (155, 5) spanning 102 by 79 pixels.
; PLAN: r0=155(x), r1=5(y), r2=102(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 5
LDI r2, 102
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
