; DESCRIPTION: Renders a white box of size 103x66 starting at (266, 0).
; PLAN: r0=266(x), r1=0(y), r2=103(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 0
LDI r2, 103
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
