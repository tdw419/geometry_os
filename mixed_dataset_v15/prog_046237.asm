; DESCRIPTION: Places a blue 119x103 rectangle at position (323, 28).
; PLAN: r0=323(x), r1=28(y), r2=119(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 28
LDI r2, 119
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
