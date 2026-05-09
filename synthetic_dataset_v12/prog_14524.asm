; DESCRIPTION: Places a yellow 109x76 rectangle at position (66, 179).
; PLAN: r0=66(x), r1=179(y), r2=109(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 179
LDI r2, 109
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
