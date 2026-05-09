; DESCRIPTION: Renders a yellow box of size 79x111 starting at (71, 55).
; PLAN: r0=71(x), r1=55(y), r2=79(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 55
LDI r2, 79
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
