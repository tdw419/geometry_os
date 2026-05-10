; DESCRIPTION: Places a white 21x63 box at position (20, 98).
; PLAN: r0=20(x), r1=98(y), r2=21(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 98
LDI r2, 21
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
