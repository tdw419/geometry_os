; DESCRIPTION: Renders a black box of size 27x13 starting at (261, 144).
; PLAN: r0=261(x), r1=144(y), r2=27(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 144
LDI r2, 27
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
