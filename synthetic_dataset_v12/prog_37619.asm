; DESCRIPTION: Renders a green box of size 105x43 starting at (262, 211).
; PLAN: r0=262(x), r1=211(y), r2=105(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 211
LDI r2, 105
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
