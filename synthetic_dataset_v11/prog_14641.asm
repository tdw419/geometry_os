; DESCRIPTION: Composite: . Then Places a green dot at position (50, 195). Then Renders a cyan disk with center (82, 57) and radius 54.
; PLAN: r0=50(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=82(x), r1=57(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (50, 195).
; PLAN: r0=50(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (82, 57) and radius 54.
; PLAN: r0=82(x), r1=57(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 57
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
