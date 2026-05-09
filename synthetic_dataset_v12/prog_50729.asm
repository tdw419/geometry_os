; DESCRIPTION: Places a red 116x57 rectangle at position (393, 37).
; PLAN: r0=393(x), r1=37(y), r2=116(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 37
LDI r2, 116
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
