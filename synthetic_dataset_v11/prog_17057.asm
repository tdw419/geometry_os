; DESCRIPTION: Renders a yellow box of size 110x50 starting at (127, 181).
; PLAN: r0=127(x), r1=181(y), r2=110(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 181
LDI r2, 110
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
