; DESCRIPTION: Composite: . Then Draws a red line from (229, 23) to (143, 180). Then Places a white 75x10 rectangle at position (103, 81).
; PLAN: r0=229(x1), r1=23(y1), r2=143(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=81(y), r2=75(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (229, 23) to (143, 180).
; PLAN: r0=229(x1), r1=23(y1), r2=143(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 23
LDI r2, 143
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 75x10 rectangle at position (103, 81).
; PLAN: r0=103(x), r1=81(y), r2=75(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 81
LDI r2, 75
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
