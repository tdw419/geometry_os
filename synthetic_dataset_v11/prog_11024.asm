; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (246, 124) to (42, 243). Then Places a blue 109x108 rectangle at position (28, 61).
; PLAN: r0=246(x1), r1=124(y1), r2=42(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=28(x), r1=61(y), r2=109(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (246, 124) to (42, 243).
; PLAN: r0=246(x1), r1=124(y1), r2=42(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 124
LDI r2, 42
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 109x108 rectangle at position (28, 61).
; PLAN: r0=28(x), r1=61(y), r2=109(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 61
LDI r2, 109
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
