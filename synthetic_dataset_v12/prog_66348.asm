; DESCRIPTION: Places a yellow 66x33 rectangle at position (361, 99).
; PLAN: r0=361(x), r1=99(y), r2=66(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 99
LDI r2, 66
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
