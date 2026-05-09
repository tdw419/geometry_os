; DESCRIPTION: Places a red 45x84 rectangle at position (222, 166).
; PLAN: r0=222(x), r1=166(y), r2=45(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 166
LDI r2, 45
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
