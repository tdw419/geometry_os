; DESCRIPTION: Renders a green box of size 61x56 starting at (347, 43).
; PLAN: r0=347(x), r1=43(y), r2=61(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 43
LDI r2, 61
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
