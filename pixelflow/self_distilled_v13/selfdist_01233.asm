; DESCRIPTION: Renders a orange rectangular region spanning 83 by 74 at (262, 46).
; PLAN: r0=262(x), r1=46(y), r2=83(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 46
LDI r2, 83
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
