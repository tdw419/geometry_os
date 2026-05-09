; DESCRIPTION: Places a red 77x70 rectangle at position (249, 6).
; PLAN: r0=249(x), r1=6(y), r2=77(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 6
LDI r2, 77
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
