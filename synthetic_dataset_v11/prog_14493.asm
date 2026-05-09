; DESCRIPTION: Composite: . Then Renders a black box of size 113x35 starting at (7, 168). Then Draws a magenta line from (218, 190) to (138, 71).
; PLAN: r0=7(x), r1=168(y), r2=113(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x1), r1=190(y1), r2=138(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 113x35 starting at (7, 168).
; PLAN: r0=7(x), r1=168(y), r2=113(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 168
LDI r2, 113
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (218, 190) to (138, 71).
; PLAN: r0=218(x1), r1=190(y1), r2=138(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 190
LDI r2, 138
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
