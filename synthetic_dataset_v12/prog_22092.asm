; DESCRIPTION: Places a red 42x107 rectangle at position (102, 82).
; PLAN: r0=102(x), r1=82(y), r2=42(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 82
LDI r2, 42
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
