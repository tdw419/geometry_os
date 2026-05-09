; DESCRIPTION: Renders a yellow box of size 99x83 starting at (347, 27).
; PLAN: r0=347(x), r1=27(y), r2=99(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 27
LDI r2, 99
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
