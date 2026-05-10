; DESCRIPTION: Renders a yellow box of size 69x46 starting at (379, 142).
; PLAN: r0=379(x), r1=142(y), r2=69(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 142
LDI r2, 69
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
