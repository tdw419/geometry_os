; DESCRIPTION: Places a yellow 99x111 rectangle at position (11, 78).
; PLAN: r0=11(x), r1=78(y), r2=99(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 78
LDI r2, 99
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
