; DESCRIPTION: Renders a green box of size 81x43 starting at (125, 174).
; PLAN: r0=125(x), r1=174(y), r2=81(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 174
LDI r2, 81
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
