; DESCRIPTION: Renders a white box of size 120x81 starting at (64, 2).
; PLAN: r0=64(x), r1=2(y), r2=120(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 2
LDI r2, 120
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
