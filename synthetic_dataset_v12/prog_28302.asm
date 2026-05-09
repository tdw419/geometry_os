; DESCRIPTION: Renders a white box of size 54x93 starting at (133, 136).
; PLAN: r0=133(x), r1=136(y), r2=54(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 136
LDI r2, 54
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
