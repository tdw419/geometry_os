; DESCRIPTION: Places a red 36x70 rectangle at position (84, 160).
; PLAN: r0=84(x), r1=160(y), r2=36(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 160
LDI r2, 36
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
