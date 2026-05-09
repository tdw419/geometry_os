; DESCRIPTION: Renders a yellow box of size 120x104 starting at (73, 127).
; PLAN: r0=73(x), r1=127(y), r2=120(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 127
LDI r2, 120
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
