; DESCRIPTION: Composite: . Then Places a red dot at position (147, 87). Then Places a white 99x113 rectangle at position (55, 40).
; PLAN: r0=147(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=40(y), r2=99(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (147, 87).
; PLAN: r0=147(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a white 99x113 rectangle at position (55, 40).
; PLAN: r0=55(x), r1=40(y), r2=99(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 40
LDI r2, 99
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
