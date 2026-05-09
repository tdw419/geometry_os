; DESCRIPTION: Creates a purple rectangular region at (89, 94) spanning 86 by 42 pixels.
; PLAN: r0=89(x), r1=94(y), r2=86(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 94
LDI r2, 86
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
