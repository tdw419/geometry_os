; DESCRIPTION: Renders a white line between points (174, 92) and (187, 146).
; PLAN: r0=174(x1), r1=92(y1), r2=187(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 92
LDI r2, 187
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
