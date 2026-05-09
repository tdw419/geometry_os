; DESCRIPTION: Places a orange 57x23 rectangle at position (165, 152).
; PLAN: r0=165(x), r1=152(y), r2=57(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 152
LDI r2, 57
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
