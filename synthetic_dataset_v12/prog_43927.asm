; DESCRIPTION: Renders a black box of size 114x16 starting at (220, 10).
; PLAN: r0=220(x), r1=10(y), r2=114(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 10
LDI r2, 114
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
