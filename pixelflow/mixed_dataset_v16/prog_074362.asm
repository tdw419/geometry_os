; DESCRIPTION: Renders a yellow box of size 80x120 starting at (101, 33).
; PLAN: r0=101(x), r1=33(y), r2=80(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 33
LDI r2, 80
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
