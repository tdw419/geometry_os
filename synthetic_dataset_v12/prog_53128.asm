; DESCRIPTION: Places a orange 90x77 rectangle at position (34, 94).
; PLAN: r0=34(x), r1=94(y), r2=90(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 94
LDI r2, 90
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
