; DESCRIPTION: Places a blue 22x27 rectangle at position (375, 117).
; PLAN: r0=375(x), r1=117(y), r2=22(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 117
LDI r2, 22
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
