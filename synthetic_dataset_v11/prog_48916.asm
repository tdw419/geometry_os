; DESCRIPTION: Renders a yellow box of size 94x24 starting at (5, 146).
; PLAN: r0=5(x), r1=146(y), r2=94(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 146
LDI r2, 94
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
