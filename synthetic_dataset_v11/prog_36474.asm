; DESCRIPTION: Places a red 106x68 rectangle at position (150, 137).
; PLAN: r0=150(x), r1=137(y), r2=106(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 137
LDI r2, 106
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
