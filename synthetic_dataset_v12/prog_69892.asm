; DESCRIPTION: Renders a yellow box of size 57x83 starting at (144, 104).
; PLAN: r0=144(x), r1=104(y), r2=57(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 104
LDI r2, 57
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
