; DESCRIPTION: Places a orange 116x93 rectangle at position (295, 160).
; PLAN: r0=295(x), r1=160(y), r2=116(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 160
LDI r2, 116
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
