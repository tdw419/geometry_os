; DESCRIPTION: Composite: . Then Places a black dot at position (168, 178). Then Creates a green rectangular region at (24, 73) spanning 53 by 112 pixels.
; PLAN: r0=168(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=24(x), r1=73(y), r2=53(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (168, 178).
; PLAN: r0=168(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (24, 73) spanning 53 by 112 pixels.
; PLAN: r0=24(x), r1=73(y), r2=53(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 73
LDI r2, 53
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
