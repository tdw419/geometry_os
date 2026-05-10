; DESCRIPTION: Renders a white rectangular region spanning 87 by 94 at (68, 76).
; PLAN: r0=68(x), r1=76(y), r2=87(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 76
LDI r2, 87
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
