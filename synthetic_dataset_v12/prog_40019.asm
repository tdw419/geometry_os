; DESCRIPTION: Renders a yellow box of size 98x48 starting at (126, 149).
; PLAN: r0=126(x), r1=149(y), r2=98(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 149
LDI r2, 98
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
