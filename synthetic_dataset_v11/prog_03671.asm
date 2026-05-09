; DESCRIPTION: Places a orange 57x103 rectangle at position (9, 51).
; PLAN: r0=9(x), r1=51(y), r2=57(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 51
LDI r2, 57
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
