; DESCRIPTION: Places a red 106x98 rectangle at position (61, 115).
; PLAN: r0=61(x), r1=115(y), r2=106(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 115
LDI r2, 106
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
