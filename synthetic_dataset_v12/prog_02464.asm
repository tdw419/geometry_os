; DESCRIPTION: Renders a yellow box of size 91x107 starting at (168, 139).
; PLAN: r0=168(x), r1=139(y), r2=91(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 139
LDI r2, 91
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
