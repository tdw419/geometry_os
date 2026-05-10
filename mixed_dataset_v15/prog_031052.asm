; DESCRIPTION: Renders a cyan line between points (487, 107) and (400, 174).
; PLAN: r0=487(x1), r1=107(y1), r2=400(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 107
LDI r2, 400
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
