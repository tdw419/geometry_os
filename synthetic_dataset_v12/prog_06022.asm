; DESCRIPTION: Renders a yellow box of size 29x45 starting at (133, 108).
; PLAN: r0=133(x), r1=108(y), r2=29(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 108
LDI r2, 29
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
