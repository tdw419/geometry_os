; DESCRIPTION: Places a yellow 47x99 rectangle at position (44, 64).
; PLAN: r0=44(x), r1=64(y), r2=47(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 64
LDI r2, 47
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
