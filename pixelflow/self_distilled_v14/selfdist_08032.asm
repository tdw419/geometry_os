; DESCRIPTION: Renders a orange rectangular region spanning 36 by 93 at (76, 103).
; PLAN: r0=76(x), r1=103(y), r2=36(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 103
LDI r2, 36
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
