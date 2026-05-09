; DESCRIPTION: Renders a white box of size 85x51 starting at (166, 57).
; PLAN: r0=166(x), r1=57(y), r2=85(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 57
LDI r2, 85
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
