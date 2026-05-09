; DESCRIPTION: Composite: . Then Draws a cyan line from (83, 180) to (69, 185). Then Renders a cyan box of size 23x48 starting at (145, 208).
; PLAN: r0=83(x1), r1=180(y1), r2=69(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=145(x), r1=208(y), r2=23(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (83, 180) to (69, 185).
; PLAN: r0=83(x1), r1=180(y1), r2=69(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 180
LDI r2, 69
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 23x48 starting at (145, 208).
; PLAN: r0=145(x), r1=208(y), r2=23(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 208
LDI r2, 23
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
