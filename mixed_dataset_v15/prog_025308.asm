; DESCRIPTION: Places a yellow 65x72 rectangle at position (323, 79).
; PLAN: r0=323(x), r1=79(y), r2=65(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 79
LDI r2, 65
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
