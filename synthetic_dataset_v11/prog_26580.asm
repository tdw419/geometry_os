; DESCRIPTION: Renders a yellow box of size 86x65 starting at (81, 28).
; PLAN: r0=81(x), r1=28(y), r2=86(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 28
LDI r2, 86
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
