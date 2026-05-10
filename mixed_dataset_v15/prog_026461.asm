; DESCRIPTION: Renders a blue box of size 68x25 starting at (241, 8).
; PLAN: r0=241(x), r1=8(y), r2=68(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 8
LDI r2, 68
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
