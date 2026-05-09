; DESCRIPTION: Composite: . Then Renders a green line between points (189, 209) and (107, 206). Then Places a black 84x44 rectangle at position (77, 38).
; PLAN: r0=189(x1), r1=209(y1), r2=107(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=38(y), r2=84(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (189, 209) and (107, 206).
; PLAN: r0=189(x1), r1=209(y1), r2=107(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 209
LDI r2, 107
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 84x44 rectangle at position (77, 38).
; PLAN: r0=77(x), r1=38(y), r2=84(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 38
LDI r2, 84
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
