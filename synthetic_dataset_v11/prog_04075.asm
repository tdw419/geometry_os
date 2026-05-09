; DESCRIPTION: Places a red 59x99 rectangle at position (117, 150).
; PLAN: r0=117(x), r1=150(y), r2=59(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 150
LDI r2, 59
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
