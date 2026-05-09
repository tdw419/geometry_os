; DESCRIPTION: Composite: . Then Renders a green line between points (223, 243) and (146, 22). Then Creates a purple rectangular region at (0, 210) spanning 55 by 43 pixels.
; PLAN: r0=223(x1), r1=243(y1), r2=146(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=0(x), r1=210(y), r2=55(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (223, 243) and (146, 22).
; PLAN: r0=223(x1), r1=243(y1), r2=146(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 243
LDI r2, 146
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (0, 210) spanning 55 by 43 pixels.
; PLAN: r0=0(x), r1=210(y), r2=55(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 210
LDI r2, 55
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
