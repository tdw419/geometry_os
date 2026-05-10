; DESCRIPTION: Renders a orange rectangular region spanning 90 by 10 at (333, 22).
; PLAN: r0=333(x), r1=22(y), r2=90(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 22
LDI r2, 90
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
