; DESCRIPTION: Places a white 48x100 rectangle at position (224, 155).
; PLAN: r0=224(x), r1=155(y), r2=48(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 155
LDI r2, 48
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
