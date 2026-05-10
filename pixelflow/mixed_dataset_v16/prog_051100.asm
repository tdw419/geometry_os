; DESCRIPTION: Places a black 68x44 rectangle at position (367, 79).
; PLAN: r0=367(x), r1=79(y), r2=68(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 79
LDI r2, 68
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
