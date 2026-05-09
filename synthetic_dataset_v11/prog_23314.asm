; DESCRIPTION: Places a red 57x16 rectangle at position (50, 26).
; PLAN: r0=50(x), r1=26(y), r2=57(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 26
LDI r2, 57
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
