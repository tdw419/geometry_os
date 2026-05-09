; DESCRIPTION: Composite: . Then Renders a cyan disk with center (135, 112) and radius 21. Then Renders a orange line between points (1, 11) and (79, 134).
; PLAN: r0=135(x), r1=112(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x1), r1=11(y1), r2=79(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (135, 112) and radius 21.
; PLAN: r0=135(x), r1=112(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 112
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (1, 11) and (79, 134).
; PLAN: r0=1(x1), r1=11(y1), r2=79(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 11
LDI r2, 79
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
