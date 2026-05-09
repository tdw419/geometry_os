; DESCRIPTION: Places a orange 38x87 rectangle at position (434, 20).
; PLAN: r0=434(x), r1=20(y), r2=38(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 20
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
