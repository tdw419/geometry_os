; DESCRIPTION: Places a red 117x113 rectangle at position (22, 25).
; PLAN: r0=22(x), r1=25(y), r2=117(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 25
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
