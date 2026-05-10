; DESCRIPTION: Renders a yellow box of size 89x50 starting at (300, 79).
; PLAN: r0=300(x), r1=79(y), r2=89(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 79
LDI r2, 89
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
