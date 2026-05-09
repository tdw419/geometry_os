; DESCRIPTION: Renders a yellow box of size 30x74 starting at (220, 160).
; PLAN: r0=220(x), r1=160(y), r2=30(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 160
LDI r2, 30
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
