; DESCRIPTION: Renders a yellow box of size 112x116 starting at (386, 127).
; PLAN: r0=386(x), r1=127(y), r2=112(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 127
LDI r2, 112
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
