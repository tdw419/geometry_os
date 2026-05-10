; DESCRIPTION: Renders a orange rectangular region spanning 60 by 60 at (276, 19).
; PLAN: r0=276(x), r1=19(y), r2=60(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 19
LDI r2, 60
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
