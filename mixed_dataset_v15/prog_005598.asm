; DESCRIPTION: Renders a yellow box of size 76x53 starting at (311, 166).
; PLAN: r0=311(x), r1=166(y), r2=76(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 166
LDI r2, 76
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
