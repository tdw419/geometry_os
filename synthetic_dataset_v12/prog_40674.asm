; DESCRIPTION: Renders a yellow box of size 29x61 starting at (219, 75).
; PLAN: r0=219(x), r1=75(y), r2=29(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 75
LDI r2, 29
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
