; DESCRIPTION: Renders a yellow box of size 31x113 starting at (80, 109).
; PLAN: r0=80(x), r1=109(y), r2=31(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 109
LDI r2, 31
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
