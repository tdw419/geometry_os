; DESCRIPTION: Places a red 106x63 rectangle at position (117, 6).
; PLAN: r0=117(x), r1=6(y), r2=106(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 6
LDI r2, 106
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
