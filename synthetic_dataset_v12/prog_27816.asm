; DESCRIPTION: Places a red 68x25 rectangle at position (116, 140).
; PLAN: r0=116(x), r1=140(y), r2=68(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 140
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
