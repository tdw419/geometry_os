; DESCRIPTION: Renders a yellow box of size 104x47 starting at (204, 66).
; PLAN: r0=204(x), r1=66(y), r2=104(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 66
LDI r2, 104
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
