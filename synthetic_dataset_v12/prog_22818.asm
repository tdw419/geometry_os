; DESCRIPTION: Renders a yellow box of size 61x101 starting at (27, 50).
; PLAN: r0=27(x), r1=50(y), r2=61(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 50
LDI r2, 61
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
