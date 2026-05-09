; DESCRIPTION: Renders a blue box of size 38x49 starting at (347, 27).
; PLAN: r0=347(x), r1=27(y), r2=38(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 27
LDI r2, 38
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
