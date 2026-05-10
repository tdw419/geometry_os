; DESCRIPTION: Renders a orange rectangular region spanning 63 by 50 at (245, 188).
; PLAN: r0=245(x), r1=188(y), r2=63(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 188
LDI r2, 63
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
