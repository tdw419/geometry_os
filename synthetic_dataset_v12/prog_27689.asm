; DESCRIPTION: Renders a cyan box of size 53x29 starting at (253, 136).
; PLAN: r0=253(x), r1=136(y), r2=53(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 136
LDI r2, 53
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
