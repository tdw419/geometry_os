; DESCRIPTION: Renders a yellow box of size 10x60 starting at (25, 91).
; PLAN: r0=25(x), r1=91(y), r2=10(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 91
LDI r2, 10
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
