; DESCRIPTION: Renders a yellow box of size 39x97 starting at (145, 27).
; PLAN: r0=145(x), r1=27(y), r2=39(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 27
LDI r2, 39
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
