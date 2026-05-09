; DESCRIPTION: Places a red 93x115 rectangle at position (57, 30).
; PLAN: r0=57(x), r1=30(y), r2=93(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 93
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
