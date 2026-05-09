; DESCRIPTION: Renders a yellow box of size 99x61 starting at (81, 30).
; PLAN: r0=81(x), r1=30(y), r2=99(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 30
LDI r2, 99
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
