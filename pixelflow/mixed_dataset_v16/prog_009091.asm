; DESCRIPTION: Renders a orange rectangular region spanning 54 by 90 at (355, 198).
; PLAN: r0=355(x), r1=198(y), r2=54(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 198
LDI r2, 54
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
