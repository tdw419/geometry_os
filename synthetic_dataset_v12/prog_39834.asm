; DESCRIPTION: Creates a purple rectangular region at (237, 156) spanning 109 by 45 pixels.
; PLAN: r0=237(x), r1=156(y), r2=109(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 156
LDI r2, 109
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
