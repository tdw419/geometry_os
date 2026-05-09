; DESCRIPTION: Composite: . Then Places a cyan dot at position (193, 36). Then Places a red circle of radius 28 at center (221, 173).
; PLAN: r0=193(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=221(x), r1=173(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (193, 36).
; PLAN: r0=193(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 36
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 28 at center (221, 173).
; PLAN: r0=221(x), r1=173(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 173
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
