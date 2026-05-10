; DESCRIPTION: Places a yellow 117x49 rectangle at position (52, 150).
; PLAN: r0=52(x), r1=150(y), r2=117(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 150
LDI r2, 117
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
