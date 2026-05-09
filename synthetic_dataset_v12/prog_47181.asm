; DESCRIPTION: Renders a blue box of size 16x24 starting at (227, 143).
; PLAN: r0=227(x), r1=143(y), r2=16(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 143
LDI r2, 16
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
