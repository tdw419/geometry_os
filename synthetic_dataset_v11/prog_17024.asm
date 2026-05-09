; DESCRIPTION: Renders a green box of size 117x36 starting at (107, 128).
; PLAN: r0=107(x), r1=128(y), r2=117(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 128
LDI r2, 117
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
