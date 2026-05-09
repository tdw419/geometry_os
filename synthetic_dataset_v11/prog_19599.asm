; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (160, 240). Then Places a orange 55x15 rectangle at position (73, 120).
; PLAN: r0=160(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=73(x), r1=120(y), r2=55(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (160, 240).
; PLAN: r0=160(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a orange 55x15 rectangle at position (73, 120).
; PLAN: r0=73(x), r1=120(y), r2=55(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 55
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
