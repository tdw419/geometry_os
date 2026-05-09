; DESCRIPTION: Places a orange 32x99 rectangle at position (456, 107).
; PLAN: r0=456(x), r1=107(y), r2=32(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 107
LDI r2, 32
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
