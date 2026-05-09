; DESCRIPTION: Composite: . Then Renders a green disk with center (124, 194) and radius 58. Then Draws a cyan line from (206, 113) to (154, 154).
; PLAN: r0=124(x), r1=194(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=113(y1), r2=154(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (124, 194) and radius 58.
; PLAN: r0=124(x), r1=194(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 194
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (206, 113) to (154, 154).
; PLAN: r0=206(x1), r1=113(y1), r2=154(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 113
LDI r2, 154
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
