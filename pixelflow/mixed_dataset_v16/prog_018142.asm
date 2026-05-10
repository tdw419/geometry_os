; DESCRIPTION: Places a orange 20x109 rectangle at position (393, 105).
; PLAN: r0=393(x), r1=105(y), r2=20(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 105
LDI r2, 20
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
