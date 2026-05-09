; DESCRIPTION: Composite: . Then Places a green 113x15 rectangle at position (129, 75). Then Draws a magenta line from (150, 179) to (158, 32).
; PLAN: r0=129(x), r1=75(y), r2=113(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x1), r1=179(y1), r2=158(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 113x15 rectangle at position (129, 75).
; PLAN: r0=129(x), r1=75(y), r2=113(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 75
LDI r2, 113
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (150, 179) to (158, 32).
; PLAN: r0=150(x1), r1=179(y1), r2=158(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 179
LDI r2, 158
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
