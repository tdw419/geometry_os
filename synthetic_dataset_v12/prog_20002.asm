; DESCRIPTION: Renders a yellow box of size 46x19 starting at (63, 54).
; PLAN: r0=63(x), r1=54(y), r2=46(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 54
LDI r2, 46
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
