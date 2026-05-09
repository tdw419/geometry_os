; DESCRIPTION: Composite: . Then Draws a cyan line from (131, 81) to (162, 216). Then Creates a magenta rectangular region at (76, 109) spanning 25 by 82 pixels.
; PLAN: r0=131(x1), r1=81(y1), r2=162(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=76(x), r1=109(y), r2=25(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (131, 81) to (162, 216).
; PLAN: r0=131(x1), r1=81(y1), r2=162(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 81
LDI r2, 162
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (76, 109) spanning 25 by 82 pixels.
; PLAN: r0=76(x), r1=109(y), r2=25(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 109
LDI r2, 25
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
