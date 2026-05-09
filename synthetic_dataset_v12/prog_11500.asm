; DESCRIPTION: Renders a black box of size 52x16 starting at (24, 32).
; PLAN: r0=24(x), r1=32(y), r2=52(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 32
LDI r2, 52
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
