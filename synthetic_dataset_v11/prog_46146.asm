; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (65, 235). Then Renders a green line between points (186, 33) and (239, 32).
; PLAN: r0=65(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=186(x1), r1=33(y1), r2=239(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (65, 235).
; PLAN: r0=65(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (186, 33) and (239, 32).
; PLAN: r0=186(x1), r1=33(y1), r2=239(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 33
LDI r2, 239
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
