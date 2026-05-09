; DESCRIPTION: Creates a white rectangular region at (326, 71) spanning 16 by 87 pixels.
; PLAN: r0=326(x), r1=71(y), r2=16(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 71
LDI r2, 16
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
