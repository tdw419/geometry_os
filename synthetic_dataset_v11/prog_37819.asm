; DESCRIPTION: Renders a yellow box of size 23x79 starting at (48, 16).
; PLAN: r0=48(x), r1=16(y), r2=23(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 16
LDI r2, 23
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
