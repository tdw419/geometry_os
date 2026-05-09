; DESCRIPTION: Composite: . Then Renders a red line between points (96, 92) and (242, 164). Then Places a blue 39x57 rectangle at position (212, 56).
; PLAN: r0=96(x1), r1=92(y1), r2=242(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=212(x), r1=56(y), r2=39(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (96, 92) and (242, 164).
; PLAN: r0=96(x1), r1=92(y1), r2=242(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 92
LDI r2, 242
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 39x57 rectangle at position (212, 56).
; PLAN: r0=212(x), r1=56(y), r2=39(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 56
LDI r2, 39
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
