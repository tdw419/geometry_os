; DESCRIPTION: Renders a white box of size 86x89 starting at (64, 93).
; PLAN: r0=64(x), r1=93(y), r2=86(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 93
LDI r2, 86
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
