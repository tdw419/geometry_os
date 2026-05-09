; DESCRIPTION: Places a blue 34x68 rectangle at position (292, 42).
; PLAN: r0=292(x), r1=42(y), r2=34(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 42
LDI r2, 34
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
