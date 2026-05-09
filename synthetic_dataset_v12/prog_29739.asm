; DESCRIPTION: Renders a yellow box of size 87x107 starting at (383, 44).
; PLAN: r0=383(x), r1=44(y), r2=87(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 44
LDI r2, 87
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
