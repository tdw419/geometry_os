; DESCRIPTION: Places a red 74x52 rectangle at position (91, 186).
; PLAN: r0=91(x), r1=186(y), r2=74(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 186
LDI r2, 74
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
