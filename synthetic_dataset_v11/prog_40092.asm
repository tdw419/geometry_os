; DESCRIPTION: Composite: . Then Places a blue 104x91 rectangle at position (41, 113). Then Sets a single cyan pixel at (14, 241).
; PLAN: r0=41(x), r1=113(y), r2=104(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=14(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 104x91 rectangle at position (41, 113).
; PLAN: r0=41(x), r1=113(y), r2=104(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 113
LDI r2, 104
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (14, 241).
; PLAN: r0=14(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
