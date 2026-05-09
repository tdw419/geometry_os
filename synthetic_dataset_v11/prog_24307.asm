; DESCRIPTION: Renders a cyan box of size 17x77 starting at (201, 83).
; PLAN: r0=201(x), r1=83(y), r2=17(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 83
LDI r2, 17
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
