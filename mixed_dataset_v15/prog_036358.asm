; DESCRIPTION: Renders a yellow box of size 11x32 starting at (395, 221).
; PLAN: r0=395(x), r1=221(y), r2=11(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 221
LDI r2, 11
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
