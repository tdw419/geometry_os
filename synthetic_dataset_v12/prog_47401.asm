; DESCRIPTION: Renders a yellow box of size 86x60 starting at (125, 33).
; PLAN: r0=125(x), r1=33(y), r2=86(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 33
LDI r2, 86
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
