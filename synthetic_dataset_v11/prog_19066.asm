; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (101, 152). Then Renders a green box of size 29x90 starting at (145, 148).
; PLAN: r0=101(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=145(x), r1=148(y), r2=29(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (101, 152).
; PLAN: r0=101(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 29x90 starting at (145, 148).
; PLAN: r0=145(x), r1=148(y), r2=29(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 148
LDI r2, 29
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
