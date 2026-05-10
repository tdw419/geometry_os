; DESCRIPTION: Renders a orange rectangular region spanning 46 by 103 at (172, 180).
; PLAN: r0=172(x), r1=180(y), r2=46(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 180
LDI r2, 46
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
