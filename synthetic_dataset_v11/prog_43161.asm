; DESCRIPTION: Composite: . Then Renders a yellow disk with center (143, 113) and radius 67. Then Draws a cyan line from (228, 187) to (167, 84).
; PLAN: r0=143(x), r1=113(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=228(x1), r1=187(y1), r2=167(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (143, 113) and radius 67.
; PLAN: r0=143(x), r1=113(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 113
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (228, 187) to (167, 84).
; PLAN: r0=228(x1), r1=187(y1), r2=167(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 187
LDI r2, 167
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
