; DESCRIPTION: Composite: . Then Places a magenta 30x76 rectangle at position (21, 161). Then Renders a green line between points (100, 66) and (156, 216).
; PLAN: r0=21(x), r1=161(y), r2=30(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x1), r1=66(y1), r2=156(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 30x76 rectangle at position (21, 161).
; PLAN: r0=21(x), r1=161(y), r2=30(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 161
LDI r2, 30
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (100, 66) and (156, 216).
; PLAN: r0=100(x1), r1=66(y1), r2=156(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 66
LDI r2, 156
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
