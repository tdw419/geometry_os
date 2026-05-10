; DESCRIPTION: Renders a orange rectangular region spanning 30 by 90 at (283, 150).
; PLAN: r0=283(x), r1=150(y), r2=30(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 150
LDI r2, 30
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
