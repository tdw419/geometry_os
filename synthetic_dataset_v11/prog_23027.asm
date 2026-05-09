; DESCRIPTION: Renders a green box of size 104x81 starting at (137, 28).
; PLAN: r0=137(x), r1=28(y), r2=104(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 28
LDI r2, 104
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
