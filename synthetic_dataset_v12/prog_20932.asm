; DESCRIPTION: Places a black 65x79 rectangle at position (29, 173).
; PLAN: r0=29(x), r1=173(y), r2=65(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 173
LDI r2, 65
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
