; DESCRIPTION: Places a green 117x96 box at position (277, 13).
; PLAN: r0=277(x), r1=13(y), r2=117(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 13
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
