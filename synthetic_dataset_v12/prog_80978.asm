; DESCRIPTION: Places a yellow 20x47 rectangle at position (425, 145).
; PLAN: r0=425(x), r1=145(y), r2=20(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 145
LDI r2, 20
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
