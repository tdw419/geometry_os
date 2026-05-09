; DESCRIPTION: Places a green 85x110 rectangle at position (112, 50).
; PLAN: r0=112(x), r1=50(y), r2=85(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 50
LDI r2, 85
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
