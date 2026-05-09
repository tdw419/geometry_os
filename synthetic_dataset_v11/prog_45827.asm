; DESCRIPTION: Composite: . Then Renders a magenta box of size 40x42 starting at (40, 53). Then Places a green line segment connecting (79, 197) to (170, 25).
; PLAN: r0=40(x), r1=53(y), r2=40(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=79(x1), r1=197(y1), r2=170(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 40x42 starting at (40, 53).
; PLAN: r0=40(x), r1=53(y), r2=40(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 53
LDI r2, 40
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (79, 197) to (170, 25).
; PLAN: r0=79(x1), r1=197(y1), r2=170(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 197
LDI r2, 170
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
