; DESCRIPTION: Places a red 105x95 rectangle at position (196, 124).
; PLAN: r0=196(x), r1=124(y), r2=105(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 124
LDI r2, 105
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
