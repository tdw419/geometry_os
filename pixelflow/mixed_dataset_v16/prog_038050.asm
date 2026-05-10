; DESCRIPTION: Renders a white box of size 106x105 starting at (278, 74).
; PLAN: r0=278(x), r1=74(y), r2=106(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 74
LDI r2, 106
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
