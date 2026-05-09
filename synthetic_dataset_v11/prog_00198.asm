; DESCRIPTION: Places a yellow 20x63 rectangle at position (226, 87).
; PLAN: r0=226(x), r1=87(y), r2=20(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 87
LDI r2, 20
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
