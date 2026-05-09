; DESCRIPTION: Creates a white rectangular region at (109, 63) spanning 70 by 93 pixels.
; PLAN: r0=109(x), r1=63(y), r2=70(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 70
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
