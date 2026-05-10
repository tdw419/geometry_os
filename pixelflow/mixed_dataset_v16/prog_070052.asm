; DESCRIPTION: Renders a orange rectangular region spanning 38 by 21 at (139, 83).
; PLAN: r0=139(x), r1=83(y), r2=38(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 83
LDI r2, 38
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
