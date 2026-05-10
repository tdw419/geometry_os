; DESCRIPTION: Places a green 75x99 rectangle at position (21, 70).
; PLAN: r0=21(x), r1=70(y), r2=75(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 70
LDI r2, 75
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
