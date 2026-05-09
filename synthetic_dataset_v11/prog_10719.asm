; DESCRIPTION: Renders a yellow box of size 55x98 starting at (191, 98).
; PLAN: r0=191(x), r1=98(y), r2=55(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 98
LDI r2, 55
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
