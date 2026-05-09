; DESCRIPTION: Composite: . Then Places a white 89x50 rectangle at position (92, 27). Then Draws a magenta line from (206, 26) to (78, 220).
; PLAN: r0=92(x), r1=27(y), r2=89(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=206(x1), r1=26(y1), r2=78(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 89x50 rectangle at position (92, 27).
; PLAN: r0=92(x), r1=27(y), r2=89(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 27
LDI r2, 89
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (206, 26) to (78, 220).
; PLAN: r0=206(x1), r1=26(y1), r2=78(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 26
LDI r2, 78
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
