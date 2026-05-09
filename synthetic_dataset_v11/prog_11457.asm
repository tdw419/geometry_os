; DESCRIPTION: Renders a purple box of size 94x80 starting at (46, 176).
; PLAN: r0=46(x), r1=176(y), r2=94(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 176
LDI r2, 94
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
