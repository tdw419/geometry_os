; DESCRIPTION: Renders a green box of size 94x83 starting at (104, 101).
; PLAN: r0=104(x), r1=101(y), r2=94(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 101
LDI r2, 94
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
