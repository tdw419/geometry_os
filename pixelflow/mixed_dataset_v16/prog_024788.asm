; DESCRIPTION: Renders a yellow box of size 16x115 starting at (311, 4).
; PLAN: r0=311(x), r1=4(y), r2=16(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 4
LDI r2, 16
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
