; DESCRIPTION: Places a red 98x87 rectangle at position (45, 165).
; PLAN: r0=45(x), r1=165(y), r2=98(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 165
LDI r2, 98
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
