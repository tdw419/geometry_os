; DESCRIPTION: Renders a orange rectangular region spanning 48 by 70 at (349, 58).
; PLAN: r0=349(x), r1=58(y), r2=48(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 58
LDI r2, 48
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
