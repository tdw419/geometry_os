; DESCRIPTION: Places a red 94x105 rectangle at position (52, 28).
; PLAN: r0=52(x), r1=28(y), r2=94(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 28
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
