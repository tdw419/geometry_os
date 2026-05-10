; DESCRIPTION: Renders a green box of size 99x35 starting at (126, 121).
; PLAN: r0=126(x), r1=121(y), r2=99(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 121
LDI r2, 99
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
