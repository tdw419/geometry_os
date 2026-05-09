; DESCRIPTION: Composite: . Then Renders a cyan line between points (149, 141) and (54, 192). Then Places a orange circle of radius 59 at center (146, 161).
; PLAN: r0=149(x1), r1=141(y1), r2=54(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=161(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (149, 141) and (54, 192).
; PLAN: r0=149(x1), r1=141(y1), r2=54(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 141
LDI r2, 54
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 59 at center (146, 161).
; PLAN: r0=146(x), r1=161(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 161
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
