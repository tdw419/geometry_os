; DESCRIPTION: Composite: . Then Places a orange 120x110 rectangle at position (7, 13). Then Places a yellow dot at position (137, 164).
; PLAN: r0=7(x), r1=13(y), r2=120(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 120x110 rectangle at position (7, 13).
; PLAN: r0=7(x), r1=13(y), r2=120(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 13
LDI r2, 120
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (137, 164).
; PLAN: r0=137(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
