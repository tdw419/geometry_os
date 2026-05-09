; DESCRIPTION: Renders a yellow box of size 14x16 starting at (46, 129).
; PLAN: r0=46(x), r1=129(y), r2=14(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 129
LDI r2, 14
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
