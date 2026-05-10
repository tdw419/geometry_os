; DESCRIPTION: Renders a orange rectangular region spanning 52 by 75 at (349, 173).
; PLAN: r0=349(x), r1=173(y), r2=52(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 173
LDI r2, 52
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
