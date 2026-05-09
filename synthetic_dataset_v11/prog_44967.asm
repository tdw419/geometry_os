; DESCRIPTION: Places a magenta 117x113 rectangle at position (65, 86).
; PLAN: r0=65(x), r1=86(y), r2=117(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 86
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
