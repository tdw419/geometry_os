; DESCRIPTION: Places a green 31x26 rectangle at position (249, 16).
; PLAN: r0=249(x), r1=16(y), r2=31(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 16
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
