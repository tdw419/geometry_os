; DESCRIPTION: Renders a green box of size 113x66 starting at (375, 112).
; PLAN: r0=375(x), r1=112(y), r2=113(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 112
LDI r2, 113
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
