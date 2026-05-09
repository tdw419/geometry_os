; DESCRIPTION: Composite: . Then Places a black 56x108 rectangle at position (171, 22). Then Places a orange dot at position (92, 223).
; PLAN: r0=171(x), r1=22(y), r2=56(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=92(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 56x108 rectangle at position (171, 22).
; PLAN: r0=171(x), r1=22(y), r2=56(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 22
LDI r2, 56
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (92, 223).
; PLAN: r0=92(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
