; DESCRIPTION: Composite: . Then Places a cyan dot at position (163, 173). Then Places a yellow 33x27 rectangle at position (211, 60).
; PLAN: r0=163(x), r1=173(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=211(x), r1=60(y), r2=33(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (163, 173).
; PLAN: r0=163(x), r1=173(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 173
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 33x27 rectangle at position (211, 60).
; PLAN: r0=211(x), r1=60(y), r2=33(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 60
LDI r2, 33
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
