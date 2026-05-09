; DESCRIPTION: Renders a yellow box of size 91x119 starting at (82, 120).
; PLAN: r0=82(x), r1=120(y), r2=91(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 120
LDI r2, 91
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
