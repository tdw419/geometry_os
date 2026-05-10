; DESCRIPTION: Places a yellow 52x27 box at position (90, 78).
; PLAN: r0=90(x), r1=78(y), r2=52(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 78
LDI r2, 52
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
