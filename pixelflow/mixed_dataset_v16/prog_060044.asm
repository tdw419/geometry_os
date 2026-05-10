; DESCRIPTION: Renders a white box of size 25x74 starting at (234, 163).
; PLAN: r0=234(x), r1=163(y), r2=25(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 163
LDI r2, 25
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
