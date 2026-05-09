; DESCRIPTION: Composite: . Then Renders a green box of size 58x57 starting at (31, 187). Then Sets a single cyan pixel at (1, 244).
; PLAN: r0=31(x), r1=187(y), r2=58(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x), r1=244(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 58x57 starting at (31, 187).
; PLAN: r0=31(x), r1=187(y), r2=58(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 187
LDI r2, 58
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (1, 244).
; PLAN: r0=1(x), r1=244(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 244
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
