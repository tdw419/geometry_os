; DESCRIPTION: Composite: . Then Places a white dot at position (246, 242). Then Renders a green box of size 47x27 starting at (62, 1).
; PLAN: r0=246(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=1(y), r2=47(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (246, 242).
; PLAN: r0=246(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 47x27 starting at (62, 1).
; PLAN: r0=62(x), r1=1(y), r2=47(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 1
LDI r2, 47
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
