; DESCRIPTION: Composite: . Then Renders a cyan disk with center (144, 171) and radius 70. Then Renders a red line between points (171, 183) and (215, 210).
; PLAN: r0=144(x), r1=171(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x1), r1=183(y1), r2=215(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (144, 171) and radius 70.
; PLAN: r0=144(x), r1=171(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 171
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (171, 183) and (215, 210).
; PLAN: r0=171(x1), r1=183(y1), r2=215(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 183
LDI r2, 215
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
