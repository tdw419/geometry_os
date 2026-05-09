; DESCRIPTION: Places a red 57x95 rectangle at position (149, 12).
; PLAN: r0=149(x), r1=12(y), r2=57(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 12
LDI r2, 57
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
