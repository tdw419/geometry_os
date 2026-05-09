; DESCRIPTION: Places a red 103x117 rectangle at position (11, 27).
; PLAN: r0=11(x), r1=27(y), r2=103(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 27
LDI r2, 103
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
