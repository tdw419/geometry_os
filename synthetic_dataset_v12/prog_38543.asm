; DESCRIPTION: Draws a green rectangle at (237, 134) with width 53 and height 120.
; PLAN: r0=237(x), r1=134(y), r2=53(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 134
LDI r2, 53
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
