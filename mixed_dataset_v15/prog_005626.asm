; DESCRIPTION: Places a blue 48x105 rectangle at position (150, 21).
; PLAN: r0=150(x), r1=21(y), r2=48(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 21
LDI r2, 48
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
