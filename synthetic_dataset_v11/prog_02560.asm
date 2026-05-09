; DESCRIPTION: Renders a yellow box of size 91x56 starting at (165, 176).
; PLAN: r0=165(x), r1=176(y), r2=91(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 176
LDI r2, 91
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
