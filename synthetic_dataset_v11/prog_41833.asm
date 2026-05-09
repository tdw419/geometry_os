; DESCRIPTION: Places a yellow 72x70 rectangle at position (5, 185).
; PLAN: r0=5(x), r1=185(y), r2=72(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 185
LDI r2, 72
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
