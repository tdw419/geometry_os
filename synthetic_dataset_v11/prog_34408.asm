; DESCRIPTION: Composite: . Then Places a white 53x109 rectangle at position (194, 95). Then Draws a orange line from (196, 29) to (132, 152).
; PLAN: r0=194(x), r1=95(y), r2=53(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x1), r1=29(y1), r2=132(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 53x109 rectangle at position (194, 95).
; PLAN: r0=194(x), r1=95(y), r2=53(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 95
LDI r2, 53
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (196, 29) to (132, 152).
; PLAN: r0=196(x1), r1=29(y1), r2=132(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 29
LDI r2, 132
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
