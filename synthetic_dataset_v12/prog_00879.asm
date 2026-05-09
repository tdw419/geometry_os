; DESCRIPTION: Places a yellow 91x109 rectangle at position (91, 94).
; PLAN: r0=91(x), r1=94(y), r2=91(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 94
LDI r2, 91
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
