; DESCRIPTION: Places a black 63x79 rectangle at position (95, 55).
; PLAN: r0=95(x), r1=55(y), r2=63(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 55
LDI r2, 63
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
