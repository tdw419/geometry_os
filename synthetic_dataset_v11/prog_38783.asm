; DESCRIPTION: Composite: . Then Places a red dot at position (184, 50). Then Renders a yellow box of size 25x17 starting at (4, 107).
; PLAN: r0=184(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=4(x), r1=107(y), r2=25(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (184, 50).
; PLAN: r0=184(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 25x17 starting at (4, 107).
; PLAN: r0=4(x), r1=107(y), r2=25(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 107
LDI r2, 25
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
