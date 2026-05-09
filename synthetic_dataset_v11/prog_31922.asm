; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (7, 9). Then Creates a yellow rectangular region at (75, 150) spanning 67 by 68 pixels.
; PLAN: r0=7(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=150(y), r2=67(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (7, 9).
; PLAN: r0=7(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 9
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (75, 150) spanning 67 by 68 pixels.
; PLAN: r0=75(x), r1=150(y), r2=67(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 150
LDI r2, 67
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
