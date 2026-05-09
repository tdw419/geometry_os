; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (64, 92). Then Renders a purple line between points (218, 111) and (48, 67).
; PLAN: r0=64(x), r1=92(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=218(x1), r1=111(y1), r2=48(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (64, 92).
; PLAN: r0=64(x), r1=92(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 92
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (218, 111) and (48, 67).
; PLAN: r0=218(x1), r1=111(y1), r2=48(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 111
LDI r2, 48
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
