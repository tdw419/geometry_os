; DESCRIPTION: Renders a yellow box of size 104x34 starting at (235, 73).
; PLAN: r0=235(x), r1=73(y), r2=104(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 73
LDI r2, 104
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
