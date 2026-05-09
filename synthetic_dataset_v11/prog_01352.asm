; DESCRIPTION: Composite: . Then Draws a cyan line from (76, 122) to (179, 218). Then Draws a white rectangle at (112, 71) with width 66 and height 73.
; PLAN: r0=76(x1), r1=122(y1), r2=179(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=112(x), r1=71(y), r2=66(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (76, 122) to (179, 218).
; PLAN: r0=76(x1), r1=122(y1), r2=179(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 122
LDI r2, 179
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (112, 71) with width 66 and height 73.
; PLAN: r0=112(x), r1=71(y), r2=66(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 71
LDI r2, 66
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
