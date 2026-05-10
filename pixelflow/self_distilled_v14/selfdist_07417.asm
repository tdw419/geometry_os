; DESCRIPTION: Places a orange 21x71 box at position (338, 21).
; PLAN: r0=338(x), r1=21(y), r2=21(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 21
LDI r2, 21
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
