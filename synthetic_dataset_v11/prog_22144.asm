; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (70, 79) to (178, 19). Then Places a blue 69x89 rectangle at position (135, 81).
; PLAN: r0=70(x1), r1=79(y1), r2=178(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=135(x), r1=81(y), r2=69(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (70, 79) to (178, 19).
; PLAN: r0=70(x1), r1=79(y1), r2=178(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 79
LDI r2, 178
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 69x89 rectangle at position (135, 81).
; PLAN: r0=135(x), r1=81(y), r2=69(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 81
LDI r2, 69
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
