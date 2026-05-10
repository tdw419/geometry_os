; DESCRIPTION: Renders a orange rectangular region spanning 103 by 94 at (21, 22).
; PLAN: r0=21(x), r1=22(y), r2=103(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 22
LDI r2, 103
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
