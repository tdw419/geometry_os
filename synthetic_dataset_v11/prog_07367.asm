; DESCRIPTION: Composite: . Then Places a green dot at position (72, 196). Then Renders a white box of size 63x48 starting at (12, 156).
; PLAN: r0=72(x), r1=196(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=12(x), r1=156(y), r2=63(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (72, 196).
; PLAN: r0=72(x), r1=196(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 196
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 63x48 starting at (12, 156).
; PLAN: r0=12(x), r1=156(y), r2=63(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 156
LDI r2, 63
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
