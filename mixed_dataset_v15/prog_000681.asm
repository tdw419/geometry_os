; DESCRIPTION: Places a black 48x79 rectangle at position (69, 21).
; PLAN: r0=69(x), r1=21(y), r2=48(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 21
LDI r2, 48
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
