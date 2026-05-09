; DESCRIPTION: Places a red 30x66 rectangle at position (246, 60).
; PLAN: r0=246(x), r1=60(y), r2=30(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 60
LDI r2, 30
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
