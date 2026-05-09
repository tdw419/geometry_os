; DESCRIPTION: Places a green 37x45 rectangle at position (72, 196).
; PLAN: r0=72(x), r1=196(y), r2=37(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 196
LDI r2, 37
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
