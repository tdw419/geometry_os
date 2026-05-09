; DESCRIPTION: Places a red 22x87 rectangle at position (272, 80).
; PLAN: r0=272(x), r1=80(y), r2=22(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 80
LDI r2, 22
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
