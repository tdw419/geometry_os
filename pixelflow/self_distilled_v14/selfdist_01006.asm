; DESCRIPTION: Renders a orange rectangular region spanning 22 by 64 at (376, 142).
; PLAN: r0=376(x), r1=142(y), r2=22(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 142
LDI r2, 22
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
