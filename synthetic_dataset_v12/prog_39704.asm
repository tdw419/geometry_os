; DESCRIPTION: Places a green 74x52 rectangle at position (126, 165).
; PLAN: r0=126(x), r1=165(y), r2=74(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 165
LDI r2, 74
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
