; DESCRIPTION: Composite: . Then Places a cyan dot at position (173, 135). Then Places a green circle of radius 60 at center (128, 135).
; PLAN: r0=173(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=135(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (173, 135).
; PLAN: r0=173(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 60 at center (128, 135).
; PLAN: r0=128(x), r1=135(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 135
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
