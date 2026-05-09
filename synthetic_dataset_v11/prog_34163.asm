; DESCRIPTION: Places a magenta 98x60 rectangle at position (115, 187).
; PLAN: r0=115(x), r1=187(y), r2=98(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 187
LDI r2, 98
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
