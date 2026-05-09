; DESCRIPTION: Renders a purple box of size 27x54 starting at (99, 84).
; PLAN: r0=99(x), r1=84(y), r2=27(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 84
LDI r2, 27
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
