; DESCRIPTION: Composite: . Then Places a yellow dot at position (197, 169). Then Renders a yellow box of size 73x24 starting at (110, 76).
; PLAN: r0=197(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=110(x), r1=76(y), r2=73(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (197, 169).
; PLAN: r0=197(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 169
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 73x24 starting at (110, 76).
; PLAN: r0=110(x), r1=76(y), r2=73(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 76
LDI r2, 73
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
