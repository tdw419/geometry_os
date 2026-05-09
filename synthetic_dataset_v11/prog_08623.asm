; DESCRIPTION: Renders a yellow box of size 94x75 starting at (45, 46).
; PLAN: r0=45(x), r1=46(y), r2=94(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 46
LDI r2, 94
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
