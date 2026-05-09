; DESCRIPTION: Composite: . Then Renders a cyan box of size 33x97 starting at (41, 66). Then Renders a red line between points (239, 81) and (77, 64).
; PLAN: r0=41(x), r1=66(y), r2=33(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=239(x1), r1=81(y1), r2=77(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 33x97 starting at (41, 66).
; PLAN: r0=41(x), r1=66(y), r2=33(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 66
LDI r2, 33
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (239, 81) and (77, 64).
; PLAN: r0=239(x1), r1=81(y1), r2=77(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 81
LDI r2, 77
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
