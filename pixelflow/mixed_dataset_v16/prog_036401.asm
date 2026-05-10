; DESCRIPTION: Renders a orange rectangular region spanning 67 by 49 at (170, 21).
; PLAN: r0=170(x), r1=21(y), r2=67(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 21
LDI r2, 67
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
