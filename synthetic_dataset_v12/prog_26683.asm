; DESCRIPTION: Places a green 105x20 rectangle at position (297, 124).
; PLAN: r0=297(x), r1=124(y), r2=105(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 124
LDI r2, 105
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
