; DESCRIPTION: Places a yellow 80x59 rectangle at position (337, 115).
; PLAN: r0=337(x), r1=115(y), r2=80(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 115
LDI r2, 80
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
