; DESCRIPTION: Renders a orange rectangular region spanning 36 by 12 at (80, 108).
; PLAN: r0=80(x), r1=108(y), r2=36(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 108
LDI r2, 36
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
