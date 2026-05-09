; DESCRIPTION: Composite: . Then Places a red 90x55 rectangle at position (34, 182). Then Sets a single green pixel at (75, 135).
; PLAN: r0=34(x), r1=182(y), r2=90(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 90x55 rectangle at position (34, 182).
; PLAN: r0=34(x), r1=182(y), r2=90(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 182
LDI r2, 90
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (75, 135).
; PLAN: r0=75(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
