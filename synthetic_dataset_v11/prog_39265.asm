; DESCRIPTION: Composite: . Then Renders a red box of size 79x63 starting at (33, 91). Then Places a green dot at position (181, 57).
; PLAN: r0=33(x), r1=91(y), r2=79(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 79x63 starting at (33, 91).
; PLAN: r0=33(x), r1=91(y), r2=79(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 91
LDI r2, 79
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (181, 57).
; PLAN: r0=181(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
