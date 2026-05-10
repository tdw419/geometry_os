; DESCRIPTION: Places a red 105x48 rectangle at position (279, 58).
; PLAN: r0=279(x), r1=58(y), r2=105(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 58
LDI r2, 105
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
