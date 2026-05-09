; DESCRIPTION: Renders a yellow box of size 12x17 starting at (454, 42).
; PLAN: r0=454(x), r1=42(y), r2=12(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 42
LDI r2, 12
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
