; DESCRIPTION: Renders a orange rectangular region spanning 29 by 37 at (38, 83).
; PLAN: r0=38(x), r1=83(y), r2=29(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 83
LDI r2, 29
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
