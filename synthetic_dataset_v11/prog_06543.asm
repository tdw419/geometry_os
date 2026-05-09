; DESCRIPTION: Composite: . Then Places a cyan circle of radius 77 at center (97, 146). Then Draws a white line from (140, 169) to (214, 249).
; PLAN: r0=97(x), r1=146(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=140(x1), r1=169(y1), r2=214(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 77 at center (97, 146).
; PLAN: r0=97(x), r1=146(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 146
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (140, 169) to (214, 249).
; PLAN: r0=140(x1), r1=169(y1), r2=214(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 169
LDI r2, 214
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
