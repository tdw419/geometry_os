; DESCRIPTION: Composite: . Then Renders a yellow box of size 63x52 starting at (122, 96). Then Places a cyan dot at position (41, 47).
; PLAN: r0=122(x), r1=96(y), r2=63(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 63x52 starting at (122, 96).
; PLAN: r0=122(x), r1=96(y), r2=63(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 96
LDI r2, 63
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (41, 47).
; PLAN: r0=41(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 47
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
