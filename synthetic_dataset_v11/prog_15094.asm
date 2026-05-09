; DESCRIPTION: Composite: . Then Renders a cyan line between points (224, 30) and (94, 99). Then Draws a black rectangle at (135, 7) with width 31 and height 48.
; PLAN: r0=224(x1), r1=30(y1), r2=94(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=135(x), r1=7(y), r2=31(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (224, 30) and (94, 99).
; PLAN: r0=224(x1), r1=30(y1), r2=94(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 30
LDI r2, 94
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (135, 7) with width 31 and height 48.
; PLAN: r0=135(x), r1=7(y), r2=31(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 7
LDI r2, 31
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
