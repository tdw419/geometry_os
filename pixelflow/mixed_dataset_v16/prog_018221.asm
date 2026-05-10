; DESCRIPTION: Places a green 57x16 rectangle at position (262, 3).
; PLAN: r0=262(x), r1=3(y), r2=57(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 3
LDI r2, 57
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
