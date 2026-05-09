; DESCRIPTION: Composite: . Then Renders a magenta line between points (228, 192) and (198, 154). Then Places a cyan circle of radius 33 at center (202, 84).
; PLAN: r0=228(x1), r1=192(y1), r2=198(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=202(x), r1=84(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (228, 192) and (198, 154).
; PLAN: r0=228(x1), r1=192(y1), r2=198(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 192
LDI r2, 198
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 33 at center (202, 84).
; PLAN: r0=202(x), r1=84(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 84
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
