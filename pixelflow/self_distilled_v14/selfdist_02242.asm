; DESCRIPTION: Renders a orange rectangular region spanning 23 by 80 at (374, 50).
; PLAN: r0=374(x), r1=50(y), r2=23(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 50
LDI r2, 23
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
