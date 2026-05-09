; DESCRIPTION: Places a orange 31x86 rectangle at position (77, 83).
; PLAN: r0=77(x), r1=83(y), r2=31(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 83
LDI r2, 31
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
