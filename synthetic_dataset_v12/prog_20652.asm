; DESCRIPTION: Renders a yellow box of size 10x37 starting at (384, 186).
; PLAN: r0=384(x), r1=186(y), r2=10(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 186
LDI r2, 10
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
