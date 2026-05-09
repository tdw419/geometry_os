; DESCRIPTION: Renders a green box of size 72x19 starting at (129, 73).
; PLAN: r0=129(x), r1=73(y), r2=72(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 73
LDI r2, 72
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
