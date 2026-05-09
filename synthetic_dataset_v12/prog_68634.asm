; DESCRIPTION: Renders a green box of size 99x35 starting at (73, 195).
; PLAN: r0=73(x), r1=195(y), r2=99(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 195
LDI r2, 99
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
