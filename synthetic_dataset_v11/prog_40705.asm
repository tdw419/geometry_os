; DESCRIPTION: Places a red 68x14 rectangle at position (30, 31).
; PLAN: r0=30(x), r1=31(y), r2=68(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 31
LDI r2, 68
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
