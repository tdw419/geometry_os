; DESCRIPTION: Places a orange 21x76 rectangle at position (231, 91).
; PLAN: r0=231(x), r1=91(y), r2=21(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 91
LDI r2, 21
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
