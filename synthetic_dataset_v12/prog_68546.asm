; DESCRIPTION: Places a green 74x75 rectangle at position (287, 27).
; PLAN: r0=287(x), r1=27(y), r2=74(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 27
LDI r2, 74
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
