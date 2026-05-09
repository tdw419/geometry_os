; DESCRIPTION: Places a red 15x10 rectangle at position (188, 207).
; PLAN: r0=188(x), r1=207(y), r2=15(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 207
LDI r2, 15
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
