; DESCRIPTION: Renders a green box of size 39x36 starting at (172, 208).
; PLAN: r0=172(x), r1=208(y), r2=39(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 39
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
