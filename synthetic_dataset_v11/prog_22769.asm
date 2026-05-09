; DESCRIPTION: Composite: . Then Renders a green line between points (182, 31) and (107, 116). Then Renders a green box of size 119x92 starting at (97, 146).
; PLAN: r0=182(x1), r1=31(y1), r2=107(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=146(y), r2=119(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (182, 31) and (107, 116).
; PLAN: r0=182(x1), r1=31(y1), r2=107(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 31
LDI r2, 107
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 119x92 starting at (97, 146).
; PLAN: r0=97(x), r1=146(y), r2=119(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 146
LDI r2, 119
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
