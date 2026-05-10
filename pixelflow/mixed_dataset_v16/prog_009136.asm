; DESCRIPTION: Places a red 52x44 rectangle at position (142, 166).
; PLAN: r0=142(x), r1=166(y), r2=52(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 166
LDI r2, 52
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
