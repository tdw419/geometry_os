; DESCRIPTION: Places a red 42x53 rectangle at position (277, 162).
; PLAN: r0=277(x), r1=162(y), r2=42(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 162
LDI r2, 42
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
