; DESCRIPTION: Places a yellow 86x22 rectangle at position (277, 188).
; PLAN: r0=277(x), r1=188(y), r2=86(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 188
LDI r2, 86
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
