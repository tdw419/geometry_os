; DESCRIPTION: Places a blue 52x62 rectangle at position (290, 124).
; PLAN: r0=290(x), r1=124(y), r2=52(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 124
LDI r2, 52
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
