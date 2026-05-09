; DESCRIPTION: Composite: . Then Places a yellow dot at position (69, 26). Then Renders a yellow box of size 101x24 starting at (154, 211).
; PLAN: r0=69(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=154(x), r1=211(y), r2=101(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (69, 26).
; PLAN: r0=69(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 101x24 starting at (154, 211).
; PLAN: r0=154(x), r1=211(y), r2=101(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 211
LDI r2, 101
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
