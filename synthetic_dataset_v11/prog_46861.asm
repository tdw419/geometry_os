; DESCRIPTION: Composite: . Then Places a green 43x40 rectangle at position (2, 107). Then Sets a single cyan pixel at (207, 214).
; PLAN: r0=2(x), r1=107(y), r2=43(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=207(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 43x40 rectangle at position (2, 107).
; PLAN: r0=2(x), r1=107(y), r2=43(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 107
LDI r2, 43
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (207, 214).
; PLAN: r0=207(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 214
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
