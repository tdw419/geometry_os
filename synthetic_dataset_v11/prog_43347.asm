; DESCRIPTION: Renders a yellow box of size 57x50 starting at (132, 16).
; PLAN: r0=132(x), r1=16(y), r2=57(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 16
LDI r2, 57
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
