; DESCRIPTION: Places a red 103x20 rectangle at position (68, 110).
; PLAN: r0=68(x), r1=110(y), r2=103(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 110
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
