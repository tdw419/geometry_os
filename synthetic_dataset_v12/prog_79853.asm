; DESCRIPTION: Renders a white line between points (443, 149) and (213, 103).
; PLAN: r0=443(x1), r1=149(y1), r2=213(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 149
LDI r2, 213
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
