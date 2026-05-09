; DESCRIPTION: Places a red 120x42 rectangle at position (156, 18).
; PLAN: r0=156(x), r1=18(y), r2=120(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 18
LDI r2, 120
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
