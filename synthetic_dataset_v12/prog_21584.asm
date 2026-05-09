; DESCRIPTION: Renders a yellow box of size 45x37 starting at (458, 59).
; PLAN: r0=458(x), r1=59(y), r2=45(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 59
LDI r2, 45
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
