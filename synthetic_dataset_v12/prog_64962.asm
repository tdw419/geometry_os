; DESCRIPTION: Places a orange 96x102 rectangle at position (250, 94).
; PLAN: r0=250(x), r1=94(y), r2=96(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 94
LDI r2, 96
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
