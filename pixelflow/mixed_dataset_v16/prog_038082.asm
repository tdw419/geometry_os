; DESCRIPTION: Renders a white box of size 35x27 starting at (81, 131).
; PLAN: r0=81(x), r1=131(y), r2=35(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 131
LDI r2, 35
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
