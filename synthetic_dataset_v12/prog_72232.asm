; DESCRIPTION: Places a green 58x13 rectangle at position (365, 212).
; PLAN: r0=365(x), r1=212(y), r2=58(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 212
LDI r2, 58
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
