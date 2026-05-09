; DESCRIPTION: Composite: . Then Places a yellow dot at position (66, 45). Then Renders a green box of size 40x115 starting at (91, 95).
; PLAN: r0=66(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=95(y), r2=40(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (66, 45).
; PLAN: r0=66(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 40x115 starting at (91, 95).
; PLAN: r0=91(x), r1=95(y), r2=40(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 95
LDI r2, 40
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
