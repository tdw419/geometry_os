; DESCRIPTION: Places a cyan 92x75 rectangle at position (236, 105).
; PLAN: r0=236(x), r1=105(y), r2=92(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 105
LDI r2, 92
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
