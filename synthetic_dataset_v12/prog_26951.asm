; DESCRIPTION: Places a orange 40x81 rectangle at position (295, 94).
; PLAN: r0=295(x), r1=94(y), r2=40(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 94
LDI r2, 40
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
