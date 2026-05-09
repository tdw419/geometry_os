; DESCRIPTION: Renders a blue box of size 57x10 starting at (56, 242).
; PLAN: r0=56(x), r1=242(y), r2=57(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 242
LDI r2, 57
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
