; DESCRIPTION: Places a blue 56x27 rectangle at position (345, 207).
; PLAN: r0=345(x), r1=207(y), r2=56(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 207
LDI r2, 56
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
