; DESCRIPTION: Renders a white box of size 90x42 starting at (51, 120).
; PLAN: r0=51(x), r1=120(y), r2=90(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 120
LDI r2, 90
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
