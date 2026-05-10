; DESCRIPTION: Renders a yellow box of size 75x113 starting at (302, 101).
; PLAN: r0=302(x), r1=101(y), r2=75(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 101
LDI r2, 75
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
