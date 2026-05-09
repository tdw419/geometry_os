; DESCRIPTION: Composite: . Then Places a green dot at position (155, 192). Then Renders a green box of size 14x92 starting at (189, 150).
; PLAN: r0=155(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=189(x), r1=150(y), r2=14(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (155, 192).
; PLAN: r0=155(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 14x92 starting at (189, 150).
; PLAN: r0=189(x), r1=150(y), r2=14(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 150
LDI r2, 14
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
