; DESCRIPTION: Renders a yellow box of size 119x31 starting at (215, 150).
; PLAN: r0=215(x), r1=150(y), r2=119(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 150
LDI r2, 119
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
