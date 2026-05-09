; DESCRIPTION: Composite: . Then Places a orange 98x80 rectangle at position (85, 52). Then Places a yellow dot at position (120, 181).
; PLAN: r0=85(x), r1=52(y), r2=98(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 98x80 rectangle at position (85, 52).
; PLAN: r0=85(x), r1=52(y), r2=98(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 52
LDI r2, 98
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (120, 181).
; PLAN: r0=120(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
