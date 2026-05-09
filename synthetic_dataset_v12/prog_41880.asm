; DESCRIPTION: Places a green 117x39 rectangle at position (312, 39).
; PLAN: r0=312(x), r1=39(y), r2=117(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 39
LDI r2, 117
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
