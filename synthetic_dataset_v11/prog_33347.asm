; DESCRIPTION: Places a red 90x30 rectangle at position (42, 59).
; PLAN: r0=42(x), r1=59(y), r2=90(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 59
LDI r2, 90
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
