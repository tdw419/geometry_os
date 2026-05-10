; DESCRIPTION: Places a white 48x74 box at position (124, 4).
; PLAN: r0=124(x), r1=4(y), r2=48(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 4
LDI r2, 48
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
