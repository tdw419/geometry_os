; DESCRIPTION: Renders a magenta box of size 51x27 starting at (440, 91).
; PLAN: r0=440(x), r1=91(y), r2=51(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 91
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
