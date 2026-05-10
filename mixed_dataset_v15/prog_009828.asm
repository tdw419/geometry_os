; DESCRIPTION: Renders a white box of size 10x109 starting at (26, 132).
; PLAN: r0=26(x), r1=132(y), r2=10(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 132
LDI r2, 10
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
