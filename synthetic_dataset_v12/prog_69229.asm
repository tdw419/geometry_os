; DESCRIPTION: Renders a yellow box of size 97x27 starting at (250, 183).
; PLAN: r0=250(x), r1=183(y), r2=97(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 183
LDI r2, 97
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
