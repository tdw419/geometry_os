; DESCRIPTION: Composite: . Then Renders a cyan line between points (150, 139) and (125, 156). Then Renders a yellow box of size 20x23 starting at (92, 132).
; PLAN: r0=150(x1), r1=139(y1), r2=125(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=132(y), r2=20(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (150, 139) and (125, 156).
; PLAN: r0=150(x1), r1=139(y1), r2=125(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 139
LDI r2, 125
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 20x23 starting at (92, 132).
; PLAN: r0=92(x), r1=132(y), r2=20(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 132
LDI r2, 20
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
