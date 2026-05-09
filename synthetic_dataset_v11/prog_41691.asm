; DESCRIPTION: Composite: . Then Places a red dot at position (181, 210). Then Places a cyan circle of radius 59 at center (135, 67).
; PLAN: r0=181(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=67(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (181, 210).
; PLAN: r0=181(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 59 at center (135, 67).
; PLAN: r0=135(x), r1=67(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 67
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
