; DESCRIPTION: Renders a orange rectangular region spanning 18 by 69 at (263, 7).
; PLAN: r0=263(x), r1=7(y), r2=18(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 7
LDI r2, 18
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
