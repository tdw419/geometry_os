; DESCRIPTION: Places a yellow 112x30 rectangle at position (72, 110).
; PLAN: r0=72(x), r1=110(y), r2=112(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 110
LDI r2, 112
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
