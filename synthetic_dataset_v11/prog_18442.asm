; DESCRIPTION: Places a red 80x113 rectangle at position (46, 63).
; PLAN: r0=46(x), r1=63(y), r2=80(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 63
LDI r2, 80
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
