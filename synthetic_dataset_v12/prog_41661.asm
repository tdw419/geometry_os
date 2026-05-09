; DESCRIPTION: Places a blue 56x98 rectangle at position (12, 18).
; PLAN: r0=12(x), r1=18(y), r2=56(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 18
LDI r2, 56
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
