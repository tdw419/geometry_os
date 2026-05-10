; DESCRIPTION: Renders a orange rectangular region spanning 31 by 98 at (314, 113).
; PLAN: r0=314(x), r1=113(y), r2=31(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 113
LDI r2, 31
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
