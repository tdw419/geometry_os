; DESCRIPTION: Places a green 120x40 rectangle at position (193, 131).
; PLAN: r0=193(x), r1=131(y), r2=120(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 131
LDI r2, 120
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
