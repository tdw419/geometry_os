; DESCRIPTION: Composite: . Then Draws a green line from (41, 100) to (76, 135). Then Renders a purple box of size 64x82 starting at (24, 34).
; PLAN: r0=41(x1), r1=100(y1), r2=76(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=34(y), r2=64(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (41, 100) to (76, 135).
; PLAN: r0=41(x1), r1=100(y1), r2=76(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 100
LDI r2, 76
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 64x82 starting at (24, 34).
; PLAN: r0=24(x), r1=34(y), r2=64(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 34
LDI r2, 64
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
