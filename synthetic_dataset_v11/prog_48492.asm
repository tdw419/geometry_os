; DESCRIPTION: Composite: . Then Places a orange dot at position (176, 240). Then Places a yellow 12x60 rectangle at position (200, 140).
; PLAN: r0=176(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=200(x), r1=140(y), r2=12(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (176, 240).
; PLAN: r0=176(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 12x60 rectangle at position (200, 140).
; PLAN: r0=200(x), r1=140(y), r2=12(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 140
LDI r2, 12
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
