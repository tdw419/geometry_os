; DESCRIPTION: Renders a yellow box of size 33x115 starting at (189, 57).
; PLAN: r0=189(x), r1=57(y), r2=33(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 57
LDI r2, 33
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
