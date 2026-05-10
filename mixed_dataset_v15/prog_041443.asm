; DESCRIPTION: Renders a purple box of size 116x109 starting at (164, 115).
; PLAN: r0=164(x), r1=115(y), r2=116(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 115
LDI r2, 116
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
