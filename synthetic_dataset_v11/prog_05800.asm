; DESCRIPTION: Renders a orange box of size 51x56 starting at (163, 45).
; PLAN: r0=163(x), r1=45(y), r2=51(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 45
LDI r2, 51
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
