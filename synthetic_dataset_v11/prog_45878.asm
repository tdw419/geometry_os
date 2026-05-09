; DESCRIPTION: Renders a white box of size 27x15 starting at (24, 22).
; PLAN: r0=24(x), r1=22(y), r2=27(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 22
LDI r2, 27
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
