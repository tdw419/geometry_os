; DESCRIPTION: Renders a white box of size 81x115 starting at (320, 132).
; PLAN: r0=320(x), r1=132(y), r2=81(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 132
LDI r2, 81
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
