; DESCRIPTION: Composite: . Then Renders a yellow box of size 84x64 starting at (49, 154). Then Places a green line segment connecting (38, 249) to (126, 21).
; PLAN: r0=49(x), r1=154(y), r2=84(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x1), r1=249(y1), r2=126(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 84x64 starting at (49, 154).
; PLAN: r0=49(x), r1=154(y), r2=84(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 154
LDI r2, 84
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (38, 249) to (126, 21).
; PLAN: r0=38(x1), r1=249(y1), r2=126(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 249
LDI r2, 126
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
