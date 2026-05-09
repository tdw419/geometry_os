; DESCRIPTION: Places a red 28x54 rectangle at position (178, 168).
; PLAN: r0=178(x), r1=168(y), r2=28(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 168
LDI r2, 28
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
