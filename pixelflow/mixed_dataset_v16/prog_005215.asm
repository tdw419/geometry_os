; DESCRIPTION: Renders a yellow box of size 79x10 starting at (386, 108).
; PLAN: r0=386(x), r1=108(y), r2=79(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 108
LDI r2, 79
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
