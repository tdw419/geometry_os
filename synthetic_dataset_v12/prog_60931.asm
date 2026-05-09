; DESCRIPTION: Places a red 87x93 rectangle at position (309, 28).
; PLAN: r0=309(x), r1=28(y), r2=87(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 28
LDI r2, 87
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
