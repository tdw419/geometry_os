; DESCRIPTION: Places a green 58x61 rectangle at position (337, 165).
; PLAN: r0=337(x), r1=165(y), r2=58(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 165
LDI r2, 58
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
