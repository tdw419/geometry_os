; DESCRIPTION: Renders a yellow box of size 25x80 starting at (189, 143).
; PLAN: r0=189(x), r1=143(y), r2=25(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 143
LDI r2, 25
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
