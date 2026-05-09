; DESCRIPTION: Renders a yellow box of size 56x35 starting at (156, 193).
; PLAN: r0=156(x), r1=193(y), r2=56(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 193
LDI r2, 56
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
