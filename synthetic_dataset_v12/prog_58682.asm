; DESCRIPTION: Places a orange 84x107 rectangle at position (84, 117).
; PLAN: r0=84(x), r1=117(y), r2=84(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 117
LDI r2, 84
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
