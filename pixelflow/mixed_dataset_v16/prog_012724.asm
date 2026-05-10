; DESCRIPTION: Places a red 23x52 box at position (285, 140).
; PLAN: r0=285(x), r1=140(y), r2=23(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 140
LDI r2, 23
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
