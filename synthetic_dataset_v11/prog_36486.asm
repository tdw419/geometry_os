; DESCRIPTION: Composite: . Then Renders a green box of size 39x33 starting at (64, 143). Then Sets a single green pixel at (39, 54).
; PLAN: r0=64(x), r1=143(y), r2=39(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=39(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 39x33 starting at (64, 143).
; PLAN: r0=64(x), r1=143(y), r2=39(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 143
LDI r2, 39
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (39, 54).
; PLAN: r0=39(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
