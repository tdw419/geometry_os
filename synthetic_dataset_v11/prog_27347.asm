; DESCRIPTION: Composite: . Then Sets a single red pixel at (64, 193). Then Renders a cyan line between points (173, 144) and (73, 148).
; PLAN: r0=64(x), r1=193(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=173(x1), r1=144(y1), r2=73(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (64, 193).
; PLAN: r0=64(x), r1=193(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 193
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (173, 144) and (73, 148).
; PLAN: r0=173(x1), r1=144(y1), r2=73(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 144
LDI r2, 73
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
