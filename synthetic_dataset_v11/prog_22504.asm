; DESCRIPTION: Composite: . Then Renders a purple box of size 59x113 starting at (142, 14). Then Sets a single black pixel at (29, 124).
; PLAN: r0=142(x), r1=14(y), r2=59(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=29(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 59x113 starting at (142, 14).
; PLAN: r0=142(x), r1=14(y), r2=59(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 14
LDI r2, 59
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (29, 124).
; PLAN: r0=29(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 124
LDI r2, 0x000000
PSET r0, r1, r2
HALT
