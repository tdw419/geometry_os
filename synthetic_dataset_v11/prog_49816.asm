; DESCRIPTION: Renders a yellow box of size 48x95 starting at (32, 69).
; PLAN: r0=32(x), r1=69(y), r2=48(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 69
LDI r2, 48
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
