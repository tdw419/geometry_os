; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (115, 71) to (145, 48). Then Places a orange 72x68 rectangle at position (57, 4).
; PLAN: r0=115(x1), r1=71(y1), r2=145(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=57(x), r1=4(y), r2=72(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (115, 71) to (145, 48).
; PLAN: r0=115(x1), r1=71(y1), r2=145(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 71
LDI r2, 145
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 72x68 rectangle at position (57, 4).
; PLAN: r0=57(x), r1=4(y), r2=72(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 4
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
