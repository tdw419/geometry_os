; DESCRIPTION: Creates a white rectangular region at (115, 127) spanning 94 by 87 pixels.
; PLAN: r0=115(x), r1=127(y), r2=94(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 127
LDI r2, 94
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
