; DESCRIPTION: Places a orange 38x16 rectangle at position (8, 5).
; PLAN: r0=8(x), r1=5(y), r2=38(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 5
LDI r2, 38
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
