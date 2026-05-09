; DESCRIPTION: Places a red 20x89 rectangle at position (416, 91).
; PLAN: r0=416(x), r1=91(y), r2=20(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 91
LDI r2, 20
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
