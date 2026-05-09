; DESCRIPTION: Places a green 98x117 rectangle at position (57, 5).
; PLAN: r0=57(x), r1=5(y), r2=98(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 5
LDI r2, 98
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
