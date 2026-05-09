; DESCRIPTION: Places a red 95x14 rectangle at position (388, 8).
; PLAN: r0=388(x), r1=8(y), r2=95(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 8
LDI r2, 95
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
