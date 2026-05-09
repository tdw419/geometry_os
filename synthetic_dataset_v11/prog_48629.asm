; DESCRIPTION: Composite: . Then Renders a white box of size 95x68 starting at (10, 96). Then Sets a single cyan pixel at (50, 116).
; PLAN: r0=10(x), r1=96(y), r2=95(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=50(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 95x68 starting at (10, 96).
; PLAN: r0=10(x), r1=96(y), r2=95(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 96
LDI r2, 95
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (50, 116).
; PLAN: r0=50(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
