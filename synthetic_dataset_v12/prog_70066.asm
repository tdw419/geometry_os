; DESCRIPTION: Places a red 82x43 rectangle at position (93, 192).
; PLAN: r0=93(x), r1=192(y), r2=82(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 192
LDI r2, 82
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
