; DESCRIPTION: Places a red 62x53 rectangle at position (280, 187).
; PLAN: r0=280(x), r1=187(y), r2=62(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 187
LDI r2, 62
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
