; DESCRIPTION: Renders a white box of size 25x116 starting at (210, 99).
; PLAN: r0=210(x), r1=99(y), r2=25(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 99
LDI r2, 25
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
