; DESCRIPTION: Places a cyan 54x59 rectangle at position (427, 145).
; PLAN: r0=427(x), r1=145(y), r2=54(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 145
LDI r2, 54
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
