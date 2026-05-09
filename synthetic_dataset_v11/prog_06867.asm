; DESCRIPTION: Composite: . Then Renders a cyan line between points (210, 58) and (111, 244). Then Renders a purple box of size 67x21 starting at (9, 133).
; PLAN: r0=210(x1), r1=58(y1), r2=111(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=133(y), r2=67(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (210, 58) and (111, 244).
; PLAN: r0=210(x1), r1=58(y1), r2=111(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 58
LDI r2, 111
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 67x21 starting at (9, 133).
; PLAN: r0=9(x), r1=133(y), r2=67(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 133
LDI r2, 67
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
