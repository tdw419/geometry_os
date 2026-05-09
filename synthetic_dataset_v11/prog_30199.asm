; DESCRIPTION: Places a red 93x67 rectangle at position (107, 86).
; PLAN: r0=107(x), r1=86(y), r2=93(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 86
LDI r2, 93
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
