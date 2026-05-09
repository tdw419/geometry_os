; DESCRIPTION: Places a red 94x79 rectangle at position (42, 35).
; PLAN: r0=42(x), r1=35(y), r2=94(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 35
LDI r2, 94
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
