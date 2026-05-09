; DESCRIPTION: Renders a red box of size 13x51 starting at (25, 150).
; PLAN: r0=25(x), r1=150(y), r2=13(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 150
LDI r2, 13
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
