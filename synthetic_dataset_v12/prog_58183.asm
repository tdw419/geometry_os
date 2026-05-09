; DESCRIPTION: Creates a black rectangular region at (8, 117) spanning 63 by 93 pixels.
; PLAN: r0=8(x), r1=117(y), r2=63(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 117
LDI r2, 63
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
