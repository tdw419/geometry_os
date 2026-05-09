; DESCRIPTION: Renders a yellow box of size 110x58 starting at (392, 190).
; PLAN: r0=392(x), r1=190(y), r2=110(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 190
LDI r2, 110
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
