; DESCRIPTION: Renders a white box of size 96x51 starting at (24, 42).
; PLAN: r0=24(x), r1=42(y), r2=96(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 42
LDI r2, 96
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
