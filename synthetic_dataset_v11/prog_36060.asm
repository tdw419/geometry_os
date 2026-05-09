; DESCRIPTION: Composite: . Then Places a orange 91x33 rectangle at position (19, 192). Then Places a yellow dot at position (52, 48).
; PLAN: r0=19(x), r1=192(y), r2=91(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x), r1=48(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 91x33 rectangle at position (19, 192).
; PLAN: r0=19(x), r1=192(y), r2=91(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 192
LDI r2, 91
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (52, 48).
; PLAN: r0=52(x), r1=48(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 48
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
