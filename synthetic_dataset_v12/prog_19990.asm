; DESCRIPTION: Renders a yellow box of size 13x13 starting at (222, 107).
; PLAN: r0=222(x), r1=107(y), r2=13(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 107
LDI r2, 13
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
