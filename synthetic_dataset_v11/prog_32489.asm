; DESCRIPTION: Renders a orange box of size 30x51 starting at (208, 166).
; PLAN: r0=208(x), r1=166(y), r2=30(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 166
LDI r2, 30
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
