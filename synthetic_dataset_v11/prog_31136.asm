; DESCRIPTION: Composite: . Then Places a white 72x67 rectangle at position (112, 180). Then Places a magenta line segment connecting (117, 212) to (123, 121).
; PLAN: r0=112(x), r1=180(y), r2=72(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=117(x1), r1=212(y1), r2=123(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 72x67 rectangle at position (112, 180).
; PLAN: r0=112(x), r1=180(y), r2=72(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 180
LDI r2, 72
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (117, 212) to (123, 121).
; PLAN: r0=117(x1), r1=212(y1), r2=123(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 212
LDI r2, 123
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
