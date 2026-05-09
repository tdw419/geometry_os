; DESCRIPTION: Renders a purple box of size 90x91 starting at (218, 84).
; PLAN: r0=218(x), r1=84(y), r2=90(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 84
LDI r2, 90
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
