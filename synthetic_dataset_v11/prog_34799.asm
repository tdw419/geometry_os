; DESCRIPTION: Places a green 119x77 rectangle at position (25, 31).
; PLAN: r0=25(x), r1=31(y), r2=119(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 31
LDI r2, 119
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
