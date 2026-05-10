; DESCRIPTION: Places a black 75x12 rectangle at position (168, 80).
; PLAN: r0=168(x), r1=80(y), r2=75(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 80
LDI r2, 75
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
