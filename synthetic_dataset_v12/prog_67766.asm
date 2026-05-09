; DESCRIPTION: Renders a yellow box of size 66x120 starting at (231, 132).
; PLAN: r0=231(x), r1=132(y), r2=66(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 132
LDI r2, 66
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
