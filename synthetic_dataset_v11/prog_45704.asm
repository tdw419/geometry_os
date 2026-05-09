; DESCRIPTION: Places a yellow 91x33 rectangle at position (33, 54).
; PLAN: r0=33(x), r1=54(y), r2=91(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 54
LDI r2, 91
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
