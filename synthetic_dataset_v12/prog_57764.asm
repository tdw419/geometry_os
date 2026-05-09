; DESCRIPTION: Renders a yellow box of size 14x63 starting at (207, 37).
; PLAN: r0=207(x), r1=37(y), r2=14(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 37
LDI r2, 14
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
