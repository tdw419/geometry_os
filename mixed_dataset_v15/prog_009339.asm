; DESCRIPTION: Renders a white box of size 55x103 starting at (426, 87).
; PLAN: r0=426(x), r1=87(y), r2=55(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 87
LDI r2, 55
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
