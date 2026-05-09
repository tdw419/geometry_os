; DESCRIPTION: Creates a yellow rectangular region at (109, 133) spanning 87 by 86 pixels.
; PLAN: r0=109(x), r1=133(y), r2=87(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 133
LDI r2, 87
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
