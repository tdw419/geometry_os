; DESCRIPTION: Renders a orange rectangular region spanning 30 by 23 at (135, 163).
; PLAN: r0=135(x), r1=163(y), r2=30(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 163
LDI r2, 30
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
