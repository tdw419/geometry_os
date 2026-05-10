; DESCRIPTION: Places a white 119x47 box at position (13, 47).
; PLAN: r0=13(x), r1=47(y), r2=119(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 47
LDI r2, 119
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
