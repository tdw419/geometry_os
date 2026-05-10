; DESCRIPTION: Renders a yellow box of size 79x56 starting at (363, 8).
; PLAN: r0=363(x), r1=8(y), r2=79(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 8
LDI r2, 79
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
