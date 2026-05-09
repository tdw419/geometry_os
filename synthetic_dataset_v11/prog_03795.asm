; DESCRIPTION: Places a white 56x118 rectangle at position (39, 48).
; PLAN: r0=39(x), r1=48(y), r2=56(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 48
LDI r2, 56
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
