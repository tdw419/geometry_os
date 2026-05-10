; DESCRIPTION: Places a green 15x117 rectangle at position (246, 103).
; PLAN: r0=246(x), r1=103(y), r2=15(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 103
LDI r2, 15
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
