; DESCRIPTION: Renders a yellow box of size 94x117 starting at (63, 131).
; PLAN: r0=63(x), r1=131(y), r2=94(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 131
LDI r2, 94
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
