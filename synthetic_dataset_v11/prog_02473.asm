; DESCRIPTION: Composite: . Then Renders a cyan box of size 72x114 starting at (84, 141). Then Draws a cyan line from (23, 151) to (212, 223).
; PLAN: r0=84(x), r1=141(y), r2=72(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=23(x1), r1=151(y1), r2=212(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 72x114 starting at (84, 141).
; PLAN: r0=84(x), r1=141(y), r2=72(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 141
LDI r2, 72
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (23, 151) to (212, 223).
; PLAN: r0=23(x1), r1=151(y1), r2=212(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 151
LDI r2, 212
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
