; DESCRIPTION: Places a green 105x92 rectangle at position (231, 96).
; PLAN: r0=231(x), r1=96(y), r2=105(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 96
LDI r2, 105
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
