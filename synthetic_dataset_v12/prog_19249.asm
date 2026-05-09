; DESCRIPTION: Renders a yellow box of size 25x111 starting at (376, 46).
; PLAN: r0=376(x), r1=46(y), r2=25(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 46
LDI r2, 25
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
