; DESCRIPTION: Places a blue 27x31 rectangle at position (85, 17).
; PLAN: r0=85(x), r1=17(y), r2=27(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 17
LDI r2, 27
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
