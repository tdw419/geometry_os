; DESCRIPTION: Renders a orange rectangular region spanning 30 by 86 at (90, 138).
; PLAN: r0=90(x), r1=138(y), r2=30(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 138
LDI r2, 30
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
