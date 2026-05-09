; DESCRIPTION: Places a red 47x16 rectangle at position (73, 105).
; PLAN: r0=73(x), r1=105(y), r2=47(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 105
LDI r2, 47
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
