; DESCRIPTION: Renders a orange box of size 42x51 starting at (411, 129).
; PLAN: r0=411(x), r1=129(y), r2=42(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 129
LDI r2, 42
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
