; DESCRIPTION: Composite: . Then Places a red 76x118 rectangle at position (88, 108). Then Places a cyan dot at position (192, 41).
; PLAN: r0=88(x), r1=108(y), r2=76(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=192(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 76x118 rectangle at position (88, 108).
; PLAN: r0=88(x), r1=108(y), r2=76(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 108
LDI r2, 76
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (192, 41).
; PLAN: r0=192(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
