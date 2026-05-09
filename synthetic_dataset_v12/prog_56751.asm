; DESCRIPTION: Places a green 91x105 rectangle at position (83, 150).
; PLAN: r0=83(x), r1=150(y), r2=91(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 150
LDI r2, 91
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
