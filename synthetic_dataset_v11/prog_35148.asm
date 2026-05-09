; DESCRIPTION: Places a green 36x25 rectangle at position (212, 205).
; PLAN: r0=212(x), r1=205(y), r2=36(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 205
LDI r2, 36
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
