; DESCRIPTION: Places a yellow 61x68 rectangle at position (91, 85).
; PLAN: r0=91(x), r1=85(y), r2=61(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 85
LDI r2, 61
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
