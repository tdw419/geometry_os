; DESCRIPTION: Renders a yellow box of size 23x74 starting at (458, 33).
; PLAN: r0=458(x), r1=33(y), r2=23(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 33
LDI r2, 23
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
