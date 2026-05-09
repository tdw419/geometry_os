; DESCRIPTION: Composite: . Then Places a white dot at position (141, 123). Then Renders a green box of size 118x68 starting at (91, 187).
; PLAN: r0=141(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=187(y), r2=118(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (141, 123).
; PLAN: r0=141(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 118x68 starting at (91, 187).
; PLAN: r0=91(x), r1=187(y), r2=118(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 187
LDI r2, 118
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
