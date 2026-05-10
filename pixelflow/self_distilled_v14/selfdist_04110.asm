; DESCRIPTION: Renders a orange rectangular region spanning 66 by 29 at (63, 178).
; PLAN: r0=63(x), r1=178(y), r2=66(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 178
LDI r2, 66
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
