; DESCRIPTION: Renders a yellow box of size 39x39 starting at (451, 19).
; PLAN: r0=451(x), r1=19(y), r2=39(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 19
LDI r2, 39
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
