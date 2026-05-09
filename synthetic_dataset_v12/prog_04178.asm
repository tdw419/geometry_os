; DESCRIPTION: Renders a yellow box of size 93x108 starting at (251, 91).
; PLAN: r0=251(x), r1=91(y), r2=93(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 91
LDI r2, 93
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
