; DESCRIPTION: Renders a yellow box of size 93x98 starting at (71, 108).
; PLAN: r0=71(x), r1=108(y), r2=93(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 108
LDI r2, 93
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
