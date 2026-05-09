; DESCRIPTION: Places a red 18x61 rectangle at position (221, 42).
; PLAN: r0=221(x), r1=42(y), r2=18(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 42
LDI r2, 18
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
