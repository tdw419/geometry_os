; DESCRIPTION: Places a green 95x119 rectangle at position (392, 76).
; PLAN: r0=392(x), r1=76(y), r2=95(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 76
LDI r2, 95
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
