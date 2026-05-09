; DESCRIPTION: Places a blue 85x65 rectangle at position (199, 20).
; PLAN: r0=199(x), r1=20(y), r2=85(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 20
LDI r2, 85
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
