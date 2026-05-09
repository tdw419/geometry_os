; DESCRIPTION: Renders a white box of size 118x91 starting at (125, 48).
; PLAN: r0=125(x), r1=48(y), r2=118(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 48
LDI r2, 118
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
