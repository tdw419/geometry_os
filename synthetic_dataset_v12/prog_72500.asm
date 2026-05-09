; DESCRIPTION: Places a red 31x65 rectangle at position (224, 61).
; PLAN: r0=224(x), r1=61(y), r2=31(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 61
LDI r2, 31
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
