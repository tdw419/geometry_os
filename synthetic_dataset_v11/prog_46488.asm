; DESCRIPTION: Places a orange 103x65 rectangle at position (133, 65).
; PLAN: r0=133(x), r1=65(y), r2=103(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 65
LDI r2, 103
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
