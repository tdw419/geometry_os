; DESCRIPTION: Renders a yellow box of size 120x83 starting at (78, 131).
; PLAN: r0=78(x), r1=131(y), r2=120(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 131
LDI r2, 120
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
