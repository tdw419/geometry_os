; DESCRIPTION: Places a orange 64x104 rectangle at position (242, 122).
; PLAN: r0=242(x), r1=122(y), r2=64(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 122
LDI r2, 64
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
