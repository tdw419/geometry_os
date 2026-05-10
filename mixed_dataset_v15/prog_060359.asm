; DESCRIPTION: Places a green 70x17 rectangle at position (362, 94).
; PLAN: r0=362(x), r1=94(y), r2=70(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 94
LDI r2, 70
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
