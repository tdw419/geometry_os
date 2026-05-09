; DESCRIPTION: Places a yellow 82x97 rectangle at position (428, 9).
; PLAN: r0=428(x), r1=9(y), r2=82(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 9
LDI r2, 82
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
