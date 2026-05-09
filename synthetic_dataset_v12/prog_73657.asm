; DESCRIPTION: Places a orange 103x75 rectangle at position (350, 119).
; PLAN: r0=350(x), r1=119(y), r2=103(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 119
LDI r2, 103
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
