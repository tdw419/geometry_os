; DESCRIPTION: Places a green 101x57 rectangle at position (111, 70).
; PLAN: r0=111(x), r1=70(y), r2=101(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 70
LDI r2, 101
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
