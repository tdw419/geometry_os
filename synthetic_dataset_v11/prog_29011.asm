; DESCRIPTION: Places a cyan line segment connecting (238, 146) to (150, 174).
; PLAN: r0=238(x1), r1=146(y1), r2=150(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 146
LDI r2, 150
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
