; DESCRIPTION: Places a green 56x76 rectangle at position (115, 87).
; PLAN: r0=115(x), r1=87(y), r2=56(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 87
LDI r2, 56
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
