; DESCRIPTION: Places a green 62x120 rectangle at position (323, 119).
; PLAN: r0=323(x), r1=119(y), r2=62(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 119
LDI r2, 62
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
