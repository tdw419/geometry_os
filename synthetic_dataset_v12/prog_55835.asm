; DESCRIPTION: Places a orange 65x61 rectangle at position (323, 86).
; PLAN: r0=323(x), r1=86(y), r2=65(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 86
LDI r2, 65
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
