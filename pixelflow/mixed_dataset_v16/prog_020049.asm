; DESCRIPTION: Places a orange 64x80 rectangle at position (107, 83).
; PLAN: r0=107(x), r1=83(y), r2=64(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 83
LDI r2, 64
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
