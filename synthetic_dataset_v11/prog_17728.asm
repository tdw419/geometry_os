; DESCRIPTION: Renders a white box of size 27x96 starting at (188, 72).
; PLAN: r0=188(x), r1=72(y), r2=27(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 72
LDI r2, 27
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
