; DESCRIPTION: Places a green 22x105 rectangle at position (289, 150).
; PLAN: r0=289(x), r1=150(y), r2=22(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 150
LDI r2, 22
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
