; DESCRIPTION: Composite: . Then Renders a cyan disk with center (114, 68) and radius 62. Then Draws a magenta line from (130, 90) to (146, 227).
; PLAN: r0=114(x), r1=68(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x1), r1=90(y1), r2=146(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (114, 68) and radius 62.
; PLAN: r0=114(x), r1=68(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 68
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (130, 90) to (146, 227).
; PLAN: r0=130(x1), r1=90(y1), r2=146(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 90
LDI r2, 146
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
