; DESCRIPTION: Places a orange 38x80 rectangle at position (185, 93).
; PLAN: r0=185(x), r1=93(y), r2=38(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 93
LDI r2, 38
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
