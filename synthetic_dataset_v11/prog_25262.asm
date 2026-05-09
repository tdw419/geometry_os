; DESCRIPTION: Places a cyan 72x119 rectangle at position (96, 105).
; PLAN: r0=96(x), r1=105(y), r2=72(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 105
LDI r2, 72
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
