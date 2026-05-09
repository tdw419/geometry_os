; DESCRIPTION: Renders a yellow box of size 60x28 starting at (70, 203).
; PLAN: r0=70(x), r1=203(y), r2=60(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 203
LDI r2, 60
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
