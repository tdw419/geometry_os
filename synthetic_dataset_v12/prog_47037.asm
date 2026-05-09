; DESCRIPTION: Renders a yellow box of size 86x19 starting at (144, 46).
; PLAN: r0=144(x), r1=46(y), r2=86(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 46
LDI r2, 86
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
