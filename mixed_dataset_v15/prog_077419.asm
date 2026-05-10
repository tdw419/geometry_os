; DESCRIPTION: Renders a orange rectangular region spanning 74 by 35 at (370, 38).
; PLAN: r0=370(x), r1=38(y), r2=74(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 38
LDI r2, 74
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
