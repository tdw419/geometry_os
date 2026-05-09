; DESCRIPTION: Composite: . Then Sets a single black pixel at (82, 59). Then Renders a black line between points (173, 73) and (67, 204).
; PLAN: r0=82(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=173(x1), r1=73(y1), r2=67(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (82, 59).
; PLAN: r0=82(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (173, 73) and (67, 204).
; PLAN: r0=173(x1), r1=73(y1), r2=67(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 73
LDI r2, 67
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
