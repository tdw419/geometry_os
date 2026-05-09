; DESCRIPTION: Renders a yellow box of size 79x65 starting at (307, 48).
; PLAN: r0=307(x), r1=48(y), r2=79(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 48
LDI r2, 79
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
