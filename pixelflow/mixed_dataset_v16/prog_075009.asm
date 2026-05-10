; DESCRIPTION: Renders a yellow box of size 101x16 starting at (91, 89).
; PLAN: r0=91(x), r1=89(y), r2=101(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 89
LDI r2, 101
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
