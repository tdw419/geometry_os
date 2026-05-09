; DESCRIPTION: Places a red 61x68 rectangle at position (148, 16).
; PLAN: r0=148(x), r1=16(y), r2=61(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 16
LDI r2, 61
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
