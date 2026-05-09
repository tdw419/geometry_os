; DESCRIPTION: Creates a white rectangular region at (87, 127) spanning 89 by 71 pixels.
; PLAN: r0=87(x), r1=127(y), r2=89(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 127
LDI r2, 89
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
