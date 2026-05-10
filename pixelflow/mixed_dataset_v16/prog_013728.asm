; DESCRIPTION: Places a red 100x37 rectangle at position (224, 36).
; PLAN: r0=224(x), r1=36(y), r2=100(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 36
LDI r2, 100
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
