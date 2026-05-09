; DESCRIPTION: Renders a yellow box of size 87x66 starting at (32, 161).
; PLAN: r0=32(x), r1=161(y), r2=87(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 161
LDI r2, 87
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
