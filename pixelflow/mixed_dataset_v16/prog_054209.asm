; DESCRIPTION: Renders a black box of size 46x91 starting at (206, 160).
; PLAN: r0=206(x), r1=160(y), r2=46(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 160
LDI r2, 46
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
