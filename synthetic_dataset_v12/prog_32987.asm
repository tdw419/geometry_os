; DESCRIPTION: Renders a orange box of size 40x51 starting at (175, 75).
; PLAN: r0=175(x), r1=75(y), r2=40(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 75
LDI r2, 40
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
