; DESCRIPTION: Places a orange 50x94 rectangle at position (125, 5).
; PLAN: r0=125(x), r1=5(y), r2=50(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 5
LDI r2, 50
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
