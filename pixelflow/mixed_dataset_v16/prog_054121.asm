; DESCRIPTION: Places a green 61x66 rectangle at position (337, 57).
; PLAN: r0=337(x), r1=57(y), r2=61(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 57
LDI r2, 61
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
