; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (24, 112) to (197, 250). Then Renders a red box of size 41x69 starting at (109, 39).
; PLAN: r0=24(x1), r1=112(y1), r2=197(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=109(x), r1=39(y), r2=41(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (24, 112) to (197, 250).
; PLAN: r0=24(x1), r1=112(y1), r2=197(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 112
LDI r2, 197
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 41x69 starting at (109, 39).
; PLAN: r0=109(x), r1=39(y), r2=41(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 39
LDI r2, 41
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
