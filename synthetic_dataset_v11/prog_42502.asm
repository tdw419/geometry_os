; DESCRIPTION: Renders a yellow box of size 48x83 starting at (74, 32).
; PLAN: r0=74(x), r1=32(y), r2=48(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 32
LDI r2, 48
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
