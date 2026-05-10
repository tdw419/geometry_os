; DESCRIPTION: Places a red 23x90 rectangle at position (32, 6).
; PLAN: r0=32(x), r1=6(y), r2=23(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 6
LDI r2, 23
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
