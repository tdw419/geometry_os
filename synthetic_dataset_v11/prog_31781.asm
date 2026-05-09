; DESCRIPTION: Composite: . Then Places a yellow 14x12 rectangle at position (227, 54). Then Places a red dot at position (217, 69).
; PLAN: r0=227(x), r1=54(y), r2=14(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=217(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 14x12 rectangle at position (227, 54).
; PLAN: r0=227(x), r1=54(y), r2=14(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 54
LDI r2, 14
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (217, 69).
; PLAN: r0=217(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 69
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
