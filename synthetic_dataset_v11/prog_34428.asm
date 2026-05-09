; DESCRIPTION: Renders a yellow box of size 42x90 starting at (204, 100).
; PLAN: r0=204(x), r1=100(y), r2=42(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 100
LDI r2, 42
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
