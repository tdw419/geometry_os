; DESCRIPTION: Renders a green box of size 116x85 starting at (90, 48).
; PLAN: r0=90(x), r1=48(y), r2=116(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 48
LDI r2, 116
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
