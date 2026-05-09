; DESCRIPTION: Composite: . Then Renders a green line between points (143, 173) and (255, 234). Then Sets a single cyan pixel at (58, 123).
; PLAN: r0=143(x1), r1=173(y1), r2=255(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (143, 173) and (255, 234).
; PLAN: r0=143(x1), r1=173(y1), r2=255(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 173
LDI r2, 255
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (58, 123).
; PLAN: r0=58(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
