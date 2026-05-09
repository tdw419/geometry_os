; DESCRIPTION: Renders a white box of size 109x77 starting at (282, 27).
; PLAN: r0=282(x), r1=27(y), r2=109(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 27
LDI r2, 109
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
