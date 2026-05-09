; DESCRIPTION: Renders a yellow box of size 104x55 starting at (372, 156).
; PLAN: r0=372(x), r1=156(y), r2=104(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 156
LDI r2, 104
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
