; DESCRIPTION: Places a yellow 87x105 box at position (71, 48).
; PLAN: r0=71(x), r1=48(y), r2=87(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 48
LDI r2, 87
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
