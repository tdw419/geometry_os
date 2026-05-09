; DESCRIPTION: Renders a yellow box of size 14x42 starting at (200, 1).
; PLAN: r0=200(x), r1=1(y), r2=14(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 1
LDI r2, 14
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
