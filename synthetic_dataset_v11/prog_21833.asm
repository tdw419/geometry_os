; DESCRIPTION: Renders a green box of size 116x25 starting at (40, 142).
; PLAN: r0=40(x), r1=142(y), r2=116(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 142
LDI r2, 116
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
