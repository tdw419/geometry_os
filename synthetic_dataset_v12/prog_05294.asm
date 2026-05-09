; DESCRIPTION: Places a green 80x10 rectangle at position (158, 117).
; PLAN: r0=158(x), r1=117(y), r2=80(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 117
LDI r2, 80
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
