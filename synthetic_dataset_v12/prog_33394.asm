; DESCRIPTION: Renders a green box of size 96x96 starting at (409, 27).
; PLAN: r0=409(x), r1=27(y), r2=96(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 27
LDI r2, 96
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
