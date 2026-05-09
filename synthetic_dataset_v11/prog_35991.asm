; DESCRIPTION: Places a red 70x80 rectangle at position (42, 49).
; PLAN: r0=42(x), r1=49(y), r2=70(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 49
LDI r2, 70
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
