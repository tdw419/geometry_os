; DESCRIPTION: Places a orange 43x120 rectangle at position (419, 94).
; PLAN: r0=419(x), r1=94(y), r2=43(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 94
LDI r2, 43
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
