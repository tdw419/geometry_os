; DESCRIPTION: Places a red 117x61 rectangle at position (307, 20).
; PLAN: r0=307(x), r1=20(y), r2=117(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 20
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
