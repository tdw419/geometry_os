; DESCRIPTION: Renders a red rectangular region spanning 62 by 79 at (109, 152).
; PLAN: r0=109(x), r1=152(y), r2=62(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 152
LDI r2, 62
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
