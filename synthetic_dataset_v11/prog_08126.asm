; DESCRIPTION: Renders a green box of size 73x36 starting at (180, 176).
; PLAN: r0=180(x), r1=176(y), r2=73(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 176
LDI r2, 73
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
