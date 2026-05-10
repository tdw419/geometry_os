; DESCRIPTION: Renders a yellow box of size 14x44 starting at (156, 94).
; PLAN: r0=156(x), r1=94(y), r2=14(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 94
LDI r2, 14
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
