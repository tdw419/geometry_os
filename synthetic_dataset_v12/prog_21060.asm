; DESCRIPTION: Places a green 92x112 rectangle at position (276, 105).
; PLAN: r0=276(x), r1=105(y), r2=92(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 105
LDI r2, 92
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
