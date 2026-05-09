; DESCRIPTION: Places a red 103x36 rectangle at position (37, 48).
; PLAN: r0=37(x), r1=48(y), r2=103(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 48
LDI r2, 103
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
