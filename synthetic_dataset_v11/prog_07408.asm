; DESCRIPTION: Composite: . Then Places a black dot at position (112, 153). Then Places a green 53x25 rectangle at position (77, 73).
; PLAN: r0=112(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=73(y), r2=53(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (112, 153).
; PLAN: r0=112(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a green 53x25 rectangle at position (77, 73).
; PLAN: r0=77(x), r1=73(y), r2=53(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 73
LDI r2, 53
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
