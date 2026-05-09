; DESCRIPTION: Composite: . Then Places a white dot at position (212, 204). Then Draws a blue line from (101, 224) to (197, 157).
; PLAN: r0=212(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=101(x1), r1=224(y1), r2=197(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (212, 204).
; PLAN: r0=212(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (101, 224) to (197, 157).
; PLAN: r0=101(x1), r1=224(y1), r2=197(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 224
LDI r2, 197
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
