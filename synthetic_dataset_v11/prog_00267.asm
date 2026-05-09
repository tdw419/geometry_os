; DESCRIPTION: Composite: . Then Renders a white box of size 33x111 starting at (8, 143). Then Places a cyan line segment connecting (114, 208) to (149, 195).
; PLAN: r0=8(x), r1=143(y), r2=33(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x1), r1=208(y1), r2=149(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 33x111 starting at (8, 143).
; PLAN: r0=8(x), r1=143(y), r2=33(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 143
LDI r2, 33
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (114, 208) to (149, 195).
; PLAN: r0=114(x1), r1=208(y1), r2=149(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 208
LDI r2, 149
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
