; DESCRIPTION: Renders a green box of size 109x43 starting at (12, 157).
; PLAN: r0=12(x), r1=157(y), r2=109(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 157
LDI r2, 109
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
