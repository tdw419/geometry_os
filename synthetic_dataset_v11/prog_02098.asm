; DESCRIPTION: Places a red 95x112 rectangle at position (42, 94).
; PLAN: r0=42(x), r1=94(y), r2=95(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 94
LDI r2, 95
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
