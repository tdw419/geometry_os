; DESCRIPTION: Renders a yellow box of size 80x32 starting at (309, 172).
; PLAN: r0=309(x), r1=172(y), r2=80(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 172
LDI r2, 80
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
