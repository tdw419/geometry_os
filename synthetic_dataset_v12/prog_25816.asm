; DESCRIPTION: Places a red 72x95 rectangle at position (178, 68).
; PLAN: r0=178(x), r1=68(y), r2=72(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 68
LDI r2, 72
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
