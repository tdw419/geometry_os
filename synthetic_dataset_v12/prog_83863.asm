; DESCRIPTION: Renders a white line between points (121, 111) and (167, 204).
; PLAN: r0=121(x1), r1=111(y1), r2=167(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 111
LDI r2, 167
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
