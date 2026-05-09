; DESCRIPTION: Renders a yellow box of size 90x117 starting at (76, 83).
; PLAN: r0=76(x), r1=83(y), r2=90(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 83
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
