; DESCRIPTION: Renders a orange box of size 45x51 starting at (182, 82).
; PLAN: r0=182(x), r1=82(y), r2=45(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 82
LDI r2, 45
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
