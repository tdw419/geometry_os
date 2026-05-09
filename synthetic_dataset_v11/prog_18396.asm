; DESCRIPTION: Places a yellow 68x74 rectangle at position (25, 163).
; PLAN: r0=25(x), r1=163(y), r2=68(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 163
LDI r2, 68
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
