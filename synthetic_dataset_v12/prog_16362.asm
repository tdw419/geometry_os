; DESCRIPTION: Places a red 56x20 rectangle at position (448, 166).
; PLAN: r0=448(x), r1=166(y), r2=56(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 166
LDI r2, 56
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
