; DESCRIPTION: Renders a yellow box of size 79x37 starting at (61, 70).
; PLAN: r0=61(x), r1=70(y), r2=79(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 70
LDI r2, 79
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
