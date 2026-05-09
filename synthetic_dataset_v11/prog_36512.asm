; DESCRIPTION: Composite: . Then Places a cyan dot at position (108, 225). Then Renders a orange box of size 33x21 starting at (89, 101).
; PLAN: r0=108(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=89(x), r1=101(y), r2=33(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (108, 225).
; PLAN: r0=108(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 225
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 33x21 starting at (89, 101).
; PLAN: r0=89(x), r1=101(y), r2=33(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 101
LDI r2, 33
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
