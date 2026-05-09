; DESCRIPTION: Places a red 80x69 rectangle at position (70, 171).
; PLAN: r0=70(x), r1=171(y), r2=80(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 171
LDI r2, 80
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
