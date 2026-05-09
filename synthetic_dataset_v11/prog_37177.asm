; DESCRIPTION: Renders a yellow box of size 87x37 starting at (146, 23).
; PLAN: r0=146(x), r1=23(y), r2=87(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 23
LDI r2, 87
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
