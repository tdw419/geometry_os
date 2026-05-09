; DESCRIPTION: Places a yellow 61x57 rectangle at position (428, 114).
; PLAN: r0=428(x), r1=114(y), r2=61(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 114
LDI r2, 61
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
