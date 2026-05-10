; DESCRIPTION: Renders a orange rectangular region spanning 56 by 82 at (302, 86).
; PLAN: r0=302(x), r1=86(y), r2=56(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 86
LDI r2, 56
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
