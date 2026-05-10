; DESCRIPTION: Places a red 95x68 rectangle at position (64, 163).
; PLAN: r0=64(x), r1=163(y), r2=95(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 163
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
