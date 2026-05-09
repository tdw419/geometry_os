; DESCRIPTION: Composite: . Then Renders a magenta box of size 48x58 starting at (202, 80). Then Sets a single cyan pixel at (52, 97).
; PLAN: r0=202(x), r1=80(y), r2=48(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 48x58 starting at (202, 80).
; PLAN: r0=202(x), r1=80(y), r2=48(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 80
LDI r2, 48
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (52, 97).
; PLAN: r0=52(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
