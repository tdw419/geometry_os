; DESCRIPTION: Places a green 22x117 rectangle at position (111, 94).
; PLAN: r0=111(x), r1=94(y), r2=22(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 94
LDI r2, 22
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
