; DESCRIPTION: Places a orange 37x77 rectangle at position (202, 21).
; PLAN: r0=202(x), r1=21(y), r2=37(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 21
LDI r2, 37
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
