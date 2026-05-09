; DESCRIPTION: Places a green 89x77 rectangle at position (22, 166).
; PLAN: r0=22(x), r1=166(y), r2=89(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 166
LDI r2, 89
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
