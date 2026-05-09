; DESCRIPTION: Places a orange 14x48 rectangle at position (44, 175).
; PLAN: r0=44(x), r1=175(y), r2=14(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 175
LDI r2, 14
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
