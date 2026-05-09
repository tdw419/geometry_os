; DESCRIPTION: Composite: . Then Places a white 74x43 rectangle at position (103, 213). Then Places a green line segment connecting (84, 230) to (202, 31).
; PLAN: r0=103(x), r1=213(y), r2=74(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x1), r1=230(y1), r2=202(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 74x43 rectangle at position (103, 213).
; PLAN: r0=103(x), r1=213(y), r2=74(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 213
LDI r2, 74
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (84, 230) to (202, 31).
; PLAN: r0=84(x1), r1=230(y1), r2=202(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 230
LDI r2, 202
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
