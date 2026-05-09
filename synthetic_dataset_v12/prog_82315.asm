; DESCRIPTION: Renders a yellow box of size 28x61 starting at (100, 27).
; PLAN: r0=100(x), r1=27(y), r2=28(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 27
LDI r2, 28
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
