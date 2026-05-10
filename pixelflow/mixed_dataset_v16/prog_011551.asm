; DESCRIPTION: Renders a yellow box of size 25x93 starting at (384, 93).
; PLAN: r0=384(x), r1=93(y), r2=25(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 93
LDI r2, 25
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
