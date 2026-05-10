; DESCRIPTION: Places a red 60x35 box at position (21, 64).
; PLAN: r0=21(x), r1=64(y), r2=60(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 64
LDI r2, 60
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
