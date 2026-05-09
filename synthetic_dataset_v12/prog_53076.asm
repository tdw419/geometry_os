; DESCRIPTION: Places a red 75x85 rectangle at position (181, 150).
; PLAN: r0=181(x), r1=150(y), r2=75(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 150
LDI r2, 75
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
