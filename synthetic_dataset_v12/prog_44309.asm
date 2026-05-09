; DESCRIPTION: Places a red 109x71 rectangle at position (82, 131).
; PLAN: r0=82(x), r1=131(y), r2=109(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 131
LDI r2, 109
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
