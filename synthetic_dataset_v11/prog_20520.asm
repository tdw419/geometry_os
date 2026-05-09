; DESCRIPTION: Renders a magenta box of size 104x76 starting at (22, 96).
; PLAN: r0=22(x), r1=96(y), r2=104(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 96
LDI r2, 104
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
