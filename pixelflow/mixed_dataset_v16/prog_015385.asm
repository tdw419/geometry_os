; DESCRIPTION: Places a green 39x44 box at position (123, 61).
; PLAN: r0=123(x), r1=61(y), r2=39(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 61
LDI r2, 39
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
