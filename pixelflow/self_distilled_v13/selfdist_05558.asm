; DESCRIPTION: Renders a orange rectangular region spanning 30 by 120 at (74, 38).
; PLAN: r0=74(x), r1=38(y), r2=30(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 38
LDI r2, 30
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
