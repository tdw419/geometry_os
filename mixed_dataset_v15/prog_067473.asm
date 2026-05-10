; DESCRIPTION: Renders a orange rectangular region spanning 72 by 120 at (50, 50).
; PLAN: r0=50(x), r1=50(y), r2=72(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 72
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
