; DESCRIPTION: Places a yellow 108x120 rectangle at position (98, 74).
; PLAN: r0=98(x), r1=74(y), r2=108(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 74
LDI r2, 108
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
