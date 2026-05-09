; DESCRIPTION: Renders a yellow box of size 104x52 starting at (296, 61).
; PLAN: r0=296(x), r1=61(y), r2=104(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 61
LDI r2, 104
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
