; DESCRIPTION: Places a orange 14x77 rectangle at position (198, 102).
; PLAN: r0=198(x), r1=102(y), r2=14(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 102
LDI r2, 14
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
