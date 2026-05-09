; DESCRIPTION: Places a red 58x109 rectangle at position (11, 39).
; PLAN: r0=11(x), r1=39(y), r2=58(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 39
LDI r2, 58
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
