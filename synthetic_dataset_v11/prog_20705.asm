; DESCRIPTION: Composite: . Then Places a yellow dot at position (94, 29). Then Renders a white box of size 103x102 starting at (122, 14).
; PLAN: r0=94(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=122(x), r1=14(y), r2=103(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (94, 29).
; PLAN: r0=94(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 29
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 103x102 starting at (122, 14).
; PLAN: r0=122(x), r1=14(y), r2=103(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 14
LDI r2, 103
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
