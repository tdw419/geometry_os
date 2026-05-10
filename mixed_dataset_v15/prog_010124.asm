; DESCRIPTION: Places a yellow 86x77 rectangle at position (9, 65).
; PLAN: r0=9(x), r1=65(y), r2=86(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 65
LDI r2, 86
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
