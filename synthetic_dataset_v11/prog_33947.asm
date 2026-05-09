; DESCRIPTION: Composite: . Then Places a black dot at position (168, 187). Then Creates a green rectangular region at (73, 26) spanning 20 by 107 pixels.
; PLAN: r0=168(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=26(y), r2=20(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (168, 187).
; PLAN: r0=168(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (73, 26) spanning 20 by 107 pixels.
; PLAN: r0=73(x), r1=26(y), r2=20(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 26
LDI r2, 20
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
