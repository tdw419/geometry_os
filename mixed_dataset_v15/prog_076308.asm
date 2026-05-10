; DESCRIPTION: Renders a orange rectangular region spanning 117 by 85 at (88, 150).
; PLAN: r0=88(x), r1=150(y), r2=117(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 150
LDI r2, 117
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
