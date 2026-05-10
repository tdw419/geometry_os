; DESCRIPTION: Places a orange 65x94 rectangle at position (338, 5).
; PLAN: r0=338(x), r1=5(y), r2=65(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 5
LDI r2, 65
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
