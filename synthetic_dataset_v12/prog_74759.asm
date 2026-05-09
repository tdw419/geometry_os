; DESCRIPTION: Places a red 95x96 rectangle at position (110, 103).
; PLAN: r0=110(x), r1=103(y), r2=95(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 103
LDI r2, 95
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
