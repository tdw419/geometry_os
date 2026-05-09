; DESCRIPTION: Renders a yellow box of size 57x99 starting at (38, 60).
; PLAN: r0=38(x), r1=60(y), r2=57(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 60
LDI r2, 57
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
