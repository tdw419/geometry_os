; DESCRIPTION: Renders a yellow box of size 40x98 starting at (156, 33).
; PLAN: r0=156(x), r1=33(y), r2=40(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 33
LDI r2, 40
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
