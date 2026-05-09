; DESCRIPTION: Places a orange 118x50 rectangle at position (255, 160).
; PLAN: r0=255(x), r1=160(y), r2=118(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 160
LDI r2, 118
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
