; DESCRIPTION: Places a green 38x117 rectangle at position (101, 60).
; PLAN: r0=101(x), r1=60(y), r2=38(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 60
LDI r2, 38
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
