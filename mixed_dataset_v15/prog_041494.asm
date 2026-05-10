; DESCRIPTION: Places a red 70x68 box at position (372, 131).
; PLAN: r0=372(x), r1=131(y), r2=70(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 131
LDI r2, 70
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
