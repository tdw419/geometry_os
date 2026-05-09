; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (82, 50). Then Creates a blue rectangular region at (158, 0) spanning 79 by 27 pixels.
; PLAN: r0=82(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=158(x), r1=0(y), r2=79(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (82, 50).
; PLAN: r0=82(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (158, 0) spanning 79 by 27 pixels.
; PLAN: r0=158(x), r1=0(y), r2=79(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 0
LDI r2, 79
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
