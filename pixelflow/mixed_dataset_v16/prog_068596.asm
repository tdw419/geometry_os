; DESCRIPTION: Places a red 30x60 rectangle at position (115, 130).
; PLAN: r0=115(x), r1=130(y), r2=30(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 130
LDI r2, 30
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
