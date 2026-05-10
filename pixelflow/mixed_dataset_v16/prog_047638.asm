; DESCRIPTION: Places a orange 15x12 rectangle at position (224, 159).
; PLAN: r0=224(x), r1=159(y), r2=15(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 159
LDI r2, 15
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
