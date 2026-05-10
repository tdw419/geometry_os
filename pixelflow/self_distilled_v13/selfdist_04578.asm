; DESCRIPTION: Renders a orange rectangular region spanning 31 by 59 at (213, 123).
; PLAN: r0=213(x), r1=123(y), r2=31(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 123
LDI r2, 31
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
