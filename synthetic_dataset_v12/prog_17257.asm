; DESCRIPTION: Renders a white box of size 73x59 starting at (424, 81).
; PLAN: r0=424(x), r1=81(y), r2=73(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 81
LDI r2, 73
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
