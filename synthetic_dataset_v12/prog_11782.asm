; DESCRIPTION: Places a red 75x38 rectangle at position (2, 93).
; PLAN: r0=2(x), r1=93(y), r2=75(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 93
LDI r2, 75
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
