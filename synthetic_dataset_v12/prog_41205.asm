; DESCRIPTION: Places a yellow 114x119 rectangle at position (392, 109).
; PLAN: r0=392(x), r1=109(y), r2=114(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 109
LDI r2, 114
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
