; DESCRIPTION: Places a black 108x95 rectangle at position (65, 79).
; PLAN: r0=65(x), r1=79(y), r2=108(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 79
LDI r2, 108
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
