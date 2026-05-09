; DESCRIPTION: Renders a yellow box of size 25x24 starting at (150, 232).
; PLAN: r0=150(x), r1=232(y), r2=25(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 232
LDI r2, 25
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
