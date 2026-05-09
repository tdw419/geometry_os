; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (110, 210). Then Renders a orange line between points (255, 9) and (42, 166).
; PLAN: r0=110(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=255(x1), r1=9(y1), r2=42(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (110, 210).
; PLAN: r0=110(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (255, 9) and (42, 166).
; PLAN: r0=255(x1), r1=9(y1), r2=42(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 9
LDI r2, 42
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
