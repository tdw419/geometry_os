; DESCRIPTION: Renders a purple box of size 91x32 starting at (129, 198).
; PLAN: r0=129(x), r1=198(y), r2=91(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 198
LDI r2, 91
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
