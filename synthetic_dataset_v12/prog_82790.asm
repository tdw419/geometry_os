; DESCRIPTION: Places a magenta 117x91 rectangle at position (276, 140).
; PLAN: r0=276(x), r1=140(y), r2=117(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 140
LDI r2, 117
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
