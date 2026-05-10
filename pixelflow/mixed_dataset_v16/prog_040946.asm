; DESCRIPTION: Renders a yellow box of size 59x30 starting at (37, 223).
; PLAN: r0=37(x), r1=223(y), r2=59(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 223
LDI r2, 59
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
