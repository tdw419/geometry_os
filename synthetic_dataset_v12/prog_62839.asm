; DESCRIPTION: Places a blue 57x10 rectangle at position (7, 21).
; PLAN: r0=7(x), r1=21(y), r2=57(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 21
LDI r2, 57
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
