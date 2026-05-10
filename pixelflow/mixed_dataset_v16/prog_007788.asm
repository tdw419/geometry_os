; DESCRIPTION: Places a red 120x88 rectangle at position (221, 84).
; PLAN: r0=221(x), r1=84(y), r2=120(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 84
LDI r2, 120
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
