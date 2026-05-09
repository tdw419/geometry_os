; DESCRIPTION: Renders a white box of size 101x14 starting at (63, 222).
; PLAN: r0=63(x), r1=222(y), r2=101(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 222
LDI r2, 101
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
