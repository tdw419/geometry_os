; DESCRIPTION: Renders a yellow box of size 96x23 starting at (32, 229).
; PLAN: r0=32(x), r1=229(y), r2=96(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 229
LDI r2, 96
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
