; DESCRIPTION: Composite: . Then Places a orange 66x100 rectangle at position (17, 68). Then Places a orange circle of radius 14 at center (208, 174).
; PLAN: r0=17(x), r1=68(y), r2=66(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=208(x), r1=174(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 66x100 rectangle at position (17, 68).
; PLAN: r0=17(x), r1=68(y), r2=66(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 68
LDI r2, 66
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 14 at center (208, 174).
; PLAN: r0=208(x), r1=174(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 174
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
