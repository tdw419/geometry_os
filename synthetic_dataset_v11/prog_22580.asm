; DESCRIPTION: Renders a white box of size 85x116 starting at (32, 115).
; PLAN: r0=32(x), r1=115(y), r2=85(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 115
LDI r2, 85
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
