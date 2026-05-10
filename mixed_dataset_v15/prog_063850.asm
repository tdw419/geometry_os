; DESCRIPTION: Renders a yellow box of size 94x73 starting at (160, 38).
; PLAN: r0=160(x), r1=38(y), r2=94(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 38
LDI r2, 94
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
