; DESCRIPTION: Renders a yellow box of size 87x29 starting at (23, 61).
; PLAN: r0=23(x), r1=61(y), r2=87(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 61
LDI r2, 87
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
