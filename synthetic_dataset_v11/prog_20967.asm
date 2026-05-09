; DESCRIPTION: Renders a yellow box of size 115x91 starting at (23, 92).
; PLAN: r0=23(x), r1=92(y), r2=115(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 92
LDI r2, 115
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
