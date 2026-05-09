; DESCRIPTION: Renders a white line between points (264, 204) and (479, 187).
; PLAN: r0=264(x1), r1=204(y1), r2=479(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 204
LDI r2, 479
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
